import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:inatel_app_challenge/core/colors.dart';

class MetricsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsApp.colorsList[3],
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 5),
            Container(
              width: double.infinity,
              child: Text(
                'Mas afinal, o que são as métricas?',
                style: TextStyle(
                  color: ColorsApp.colorsList[2],
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 15),
            ExpansionTileCard(
              trailing: Icon(
                Icons.keyboard_arrow_down,
                color: ColorsApp.colorsList[3],
              ),
              animateTrailing: true,
              shadowColor: ColorsApp.colorsList[3],
              expandedColor: ColorsApp.colorsList[2],
              baseColor: ColorsApp.colorsList[2],
              leading: CircleAvatar(
                  backgroundColor: ColorsApp.colorsList[3],
                  child: Icon(
                    Icons.access_time_outlined,
                    color: ColorsApp.colorsList[2],
                  )),
              title: Text(
                'Latência',
                style: TextStyle(
                  color: ColorsApp.colorsList[3],
                ),
              ),
              children: <Widget>[
                Divider(
                  thickness: 1.0,
                  height: 1.0,
                  color: ColorsApp.colorsList[3],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      'Latência, popularmente conhecida como Ping, significa atraso. Latência na internet ' +
                          'quer dizer a quantidade de atraso (o tempo) que' +
                          ' uma solicitação leva para ser transferida de um ponto ' +
                          'para outro e é medida por milissegundos (ms). Por exemplo, ao consultarmos uma API' +
                          ' realizamos uma solicitação, e esperamos uma resposta.\n' +
                          'Para conhecimento, aqui estamos realizando o teste de latência em "www.google.com".',
                      style: TextStyle(
                          color: ColorsApp.colorsList[3], fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            ExpansionTileCard(
              trailing: Icon(
                Icons.keyboard_arrow_down,
                color: ColorsApp.colorsList[3],
              ),
              animateTrailing: true,
              shadowColor: ColorsApp.colorsList[3],
              expandedColor: ColorsApp.colorsList[2],
              baseColor: ColorsApp.colorsList[2],
              leading: CircleAvatar(
                  backgroundColor: ColorsApp.colorsList[3],
                  child: Icon(
                    Icons.download_outlined,
                    color: ColorsApp.colorsList[2],
                  )),
              title: Text(
                'Taxa de Download',
                style: TextStyle(
                  color: ColorsApp.colorsList[3],
                ),
              ),
              children: <Widget>[
                Divider(
                  thickness: 1.0,
                  height: 1.0,
                  color: ColorsApp.colorsList[3],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      'Podemos definir velocidade de download como sendo' +
                          ' a velocidade com que você pode puxar os dados do servidor.' +
                          ' A maior parte das conexões é projetada para download muito mais veloz do que o upload.' +
                          'Isso acontece porque a maioria das atividades' +
                          ' online, como carregar uma página ou streaming de vídeos,' +
                          ' consiste em downloads.' +
                          'A velocidade de download é medida em bits por' +
                          ' segundo, e as operadoras nomeiam com o múltiplo “mega”. ' +
                          'Por isso, nós lemos megabits por segundo (ou Mbps).',
                      style: TextStyle(
                          color: ColorsApp.colorsList[3], fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            ExpansionTileCard(
              trailing: Icon(
                Icons.keyboard_arrow_down,
                color: ColorsApp.colorsList[3],
              ),
              animateTrailing: true,
              shadowColor: ColorsApp.colorsList[3],
              expandedColor: ColorsApp.colorsList[2],
              baseColor: ColorsApp.colorsList[2],
              leading: CircleAvatar(
                  backgroundColor: ColorsApp.colorsList[3],
                  child: Icon(
                    Icons.upload_outlined,
                    color: ColorsApp.colorsList[2],
                  )),
              title: Text(
                'Taxa de Upload',
                style: TextStyle(
                  color: ColorsApp.colorsList[3],
                ),
              ),
              children: <Widget>[
                Divider(
                  thickness: 1.0,
                  height: 1.0,
                  color: ColorsApp.colorsList[3],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      'A velocidade de Upload é a velocidade com que você envia dados do seu computador' +
                          ' para outras pessoas ou servidores.' +
                          'O upload é fundamental para enviar arquivos grandes por e-mail, por exemplo,' +
                          ' ou para usar uma função de conversa via vídeo-chat com alguém.',
                      style: TextStyle(
                          color: ColorsApp.colorsList[3], fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
