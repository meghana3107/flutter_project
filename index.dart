import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/api.dart';
import 'package:pokedex/pokemon/details.dart';
import 'package:pokedex/pokemon/models.dart';

class PokemonsListPage extends StatefulWidget {
  const PokemonsListPage({super.key});

  @override
  State<PokemonsListPage> createState() => _PokemonsListPageState();
}

class _PokemonsListPageState extends State<PokemonsListPage> {
  List<Pokemon> pokemons = [];
  bool isLoading = true;
  bool isLoadingError = false;

  @override
  void initState() {
    super.initState();

    getPokemons().then((result) {
      print('Response $result');

      setState(() {
        pokemons = result;
        isLoading = false;
      });
    }).catchError((e, st) {
      setState(() {
        isLoading = false;
        isLoadingError = true;
      });
      print(e);
      debugPrintStack(stackTrace: st);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pokedex')),
      body: isLoading
          ? CircularProgressIndicator()
          : isLoadingError
              ? Icon(Icons.warning)
              : PokemonsList(pokemons: pokemons),
    );
  }
}

class PokemonsList extends StatelessWidget {
  const PokemonsList({
    super.key,
    required this.pokemons,
  });

  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      children: pokemons.map((pokemon) {
        return PokemonWidget(pokemon: pokemon);
      }).toList(),
      crossAxisCount: 3,
      childAspectRatio: 0.75,
    );
  }
}

class PokemonWidget extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonWidget({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.blue.shade100.withOpacity(0.5),
        border: Border.all(
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          print('${pokemon.name} tapped');

          var navigatorState = Navigator.of(context);
          navigatorState.push(MaterialPageRoute(
            builder: (context) {
              return PokemonDetailsPage(pokemon: pokemon,);
            },
          ));
        },
        splashColor: Colors.red,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: [
            Hero(
              tag: pokemon.id,
              child: Image.network(
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${pokemon.id}.png'),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(pokemon.name),
          ],
        ),
      ),
    );
  }
}
