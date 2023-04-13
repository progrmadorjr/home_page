import 'package:flutter/material.dart';
import 'package:flutter_page/note.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _animation = Tween<double>(begin: 0, end: 44).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 16, 88, 146),
        appBar: AppBar(
          backgroundColor: Colors.white38,
          elevation: 0,
          title: const Text(''),
          toolbarHeight: 70,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(18),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                bool hasPermission = true;
                if (hasPermission) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Note()),
                  );
                }
              },
            ),
          ],
        ),
        //Menu latereal do perfil
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: const Text('Edward Newgate'),
                accountEmail: const Text("EdwardNewgate@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.network(
                      'https://img.freepik.com/psd-premium/ilustracao-3d-de-homem-de-negocios-com-oculos_23-2149436193.jpg',
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://i2.wp.com/exatusonline.com.br/site/uploads/2021/03/bolsa-de-valores.png?fit=900%2C450&quality=90&strip=all&ssl=1',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.mail),
                title: const Text('E-mail'),
                onTap: () => print('clicou'),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('Contato'),
                onTap: () => print('clicou'),
              ),
              ListTile(
                leading: const Icon(Icons.description),
                title: const Text('Contrato'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Contrato()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Ajustes'),
                onTap: () => print('clicou'),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Sair'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Deseja realmente sair?'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Cancelar'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Sair'),
                            onPressed: () {
                              // Adicione aqui o código para sair do aplicativo
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
        //gradiente fundo
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 16, 88, 146),
                Color.fromARGB(255, 72, 177, 191),
              ],
            ),
          ),
           //codigo da porcentagem
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 250,
                          width: 250,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Center(
                                child: ClipOval(
                                  child: Image.network(
                                    'https://imgs1.cdn-imobibrasil.com.br/imagens/imoveis/20200228075135862.jpeg',
                                    width: 250,
                                    height: 250,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              CircularProgressIndicator(
                                value: _animation.value / 44,
                                strokeWidth: 20,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${_animation.value.toStringAsFixed(0)}%',
                          style: const TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 120,
                decoration: const BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 90,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.account_balance,
                              color: Colors.blue,
                            ),
                            Text(
                              'R\$ ${2500.00.toStringAsFixed(2).replaceAll('.', ',')}',
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.green,
                              ),
                            ),
                            const Text(
                              'Total Aplicado',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // card 2
                    SizedBox(
                      width: 100,
                      height: 90,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.monetization_on,
                              color: Colors.blue,
                            ),
                            Text(
                              'R\$ ${150.50.toStringAsFixed(2).replaceAll('.', ',')}',
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.green,
                              ),
                            ),
                            const Text(
                              'Rentabilidade',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //card 3
                    SizedBox(
                      width: 100,
                      height: 90,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 10,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.trending_up,
                              color: Colors.red,
                            ),
                            Text(
                              '50%',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.green,
                              ),
                            ),
                            Text(
                              'Rendimento',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
