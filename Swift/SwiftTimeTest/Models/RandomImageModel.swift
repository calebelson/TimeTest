//
//  RandomImageModel.swift
//  SwiftTimeTest
//
//  Created by Caleb Elson on 22/10/2024.
//

class RandomImage {
    func getRandomImage() -> String {
        return images.randomElement()!
    }
    
    private let images = [
        "black-white-city",
        "photo-1421789665209-c9b2a435e3dc",
        "photo-1422207134147-65fb81f59e38",
        "photo-1422360902398-0a91ff2c1a1f",
        "photo-1427087302890-2f05ee3bee12",
        "photo-1429552054921-018e433d7d34",
        "photo-1431538510849-b719825bf08b",
        "photo-1431576901776-e539bd916ba2",
        "photo-1432821579285-1b649e5b1ce3",
        "photo-1437419764061-2473afe69fc2",
        "photo-1437422061949-f6efbde0a471",
        "photo-1443890923422-7819ed4101c0",
        "photo-1446329813274-7c9036bd9a1f",
        "photo-1446776653964-20c1d3a81b06",
        "photo-1448357019934-caa4696bb949",
        "photo-1449157291145-7efd050a4d0e",
        "photo-1449942120512-7a6f1ea6b0c4",
        "photo-1451187580459-43490279c0fa",
        "photo-1453090927415-5f45085b65c0",
        "photo-1454817481404-7e84c1b73b4a",
        "photo-1455383333344-451b6147021b",
        "photo-1455656678494-4d1b5f3e7ad4",
        "photo-1456244440184-1d494704a505",
        "photo-1457459686225-c7db79d4e59f",
        "photo-1457685373807-8c4d8be4c560",
        "photo-1458668383970-8ddd3927deed",
        "photo-1460574283810-2aab119d8511",
        "photo-1461353789837-8eb180f968d2",
        "photo-1462331321792-cc44368b8894",
        "photo-1462331940025-496dfbfc7564",
        "photo-1462332420958-a05d1e002413",
        "photo-1462899006636-339e08d1844e",
        "photo-1462903004115-f8e27d6a3985",
        "photo-1464621922360-27f3bf0eca75",
        "photo-1464817739973-0128fe77aaa1",
        "photo-1465438503376-a2a921c57ffa",
        "photo-1465935343323-d742334bcbda",
        "photo-1467358895199-cd5d1847a7e4",
        "photo-1467810563316-b5476525c0f9",
        "photo-1468325089340-2ec20e175048",
        "photo-1468436139062-f60a71c5c892",
        "photo-1468536029150-d16666b345a1",
        "photo-1471644518115-1f02e9819854",
        "photo-1471769321038-24f4db35b24d",
        "photo-1471872973917-3e115886ed07",
        "photo-1473197411253-0151b2882b52",
        "photo-1473308822086-710304d7d30c",
        "photo-1473800447596-01729482b8eb",
        "photo-1475241404975-c3ae90fdd9e6",
        "photo-1475754857078-5c15de17844c",
        "photo-1475778057357-d35f37fa89dd",
        "photo-1476067897447-d0c5df27b5df",
        "photo-1476362555312-ab9e108a0b7e",
        "photo-1476483547798-bf769a2cbba5",
        "photo-1476514525535-07fb3b4ae5f1",
        "photo-1476522183715-d1a7af59419f",
        "photo-1476820865390-c52aeebb9891",
        "photo-1476891626313-2cecb3820a69",
        "photo-1477244075012-5cc28286e465",
        "photo-1477489875296-423abee7bade",
        "photo-1477501502166-8c6f76b18a1b",
        "photo-1477951233099-d2c5fbd878ee",
        "photo-1478031706604-bb4b7b0b4e9e",
        "photo-1478428036186-d435e23988ea",
        "photo-1479030160180-b1860951d696",
        "photo-1479147014836-dda42d84c1a9",
        "photo-1479839672679-a46483c0e7c8",
        "photo-1480241352829-e1573ff2414e",
        "photo-1480506132288-68f7705954bd",
        "photo-1480618757544-81c31930008e",
        "photo-1481026469463-66327c86e544",
        "photo-1482003297000-b7663a1673f1",
        "photo-1482855549413-2a6c9b1955a7",
        "photo-1483094035713-218a81c0d971",
        "photo-1483653085484-eb63c9f02547",
        "photo-1483804728039-acddc304e9cc",
        "photo-1483992233021-1801812fdacb",
        "photo-1484100356142-db6ab6244067",
        "photo-1484420269607-41d8060e9779",
        "photo-1484882918957-e9f6567be3c8",
        "photo-1485889397316-8393dd065127",
        "photo-1486230057997-a68a7fe3b16e",
        "photo-1486692957922-ea51ea8472bc",
        "photo-1487023269153-8ab6d0e24173",
        "photo-1487111023822-2e903e12f6f0",
        "photo-1487525219605-eadb39ae229c",
        "photo-1487621167305-5d248087c724",
        "photo-1488190211105-8b0e65b80b4e",
        "photo-1488489153583-89ce18dd4968",
        "photo-1489343511429-5482f78c15cf",
        "photo-1489537235181-fc05daed5805",
        "photo-1491514104444-e033f313a5fc",
        "photo-1493441883526-0ed85220dc0c",
        "photo-1493704074932-e1c9d6ccd131",
        "photo-1494253188410-ff0cdea5499e",
        "photo-1494822493217-c9840aba840c",
        "photo-1494891848038-7bd202a2afeb",
        "photo-1495045197504-5128e3c8469f",
        "photo-1495195129352-aeb325a55b65",
        "photo-1495250357898-6822052ef5b8",
        "photo-1495431088732-09e59535d241",
        "photo-1495603491717-3d3374928dc6",
        "photo-1495743853775-60402c6c643e",
        "photo-1496060169243-453fde45943b",
        "photo-1496148353342-96817d85ea40",
        "photo-1496170804262-975019a5cd34",
        "photo-1496208612508-eb52fba7d94e",
        "photo-1496259947555-d77e1140f6c5",
        "photo-1496264057429-6a331647b69e",
        "photo-1496282413736-d42bd1e239b8",
        "photo-1496483353456-90997957cf99",
        "photo-1496688519089-de7d4b5c05d7",
        "photo-1497010905071-cba70e163811",
        "photo-1498036882173-b41c28a8ba34",
        "photo-1498713301984-508015049dc1",
        "photo-1499744937866-d7e566a20a61",
        "photo-1499865375034-7cccc6d92a18",
        "photo-1500393734221-584dd6dbf92a",
        "photo-1500412830877-c77d92c33203",
        "photo-1500531279542-fc8490c8ea4d",
        "photo-1501820434261-5bb046afcf6b",
        "photo-1502133639165-ea20bc43e157",
        "photo-1502517787199-e68205b0c811",
        "photo-1503206557829-9a9979ad1227",
        "photo-1503435980610-a51f3ddfee50",
        "photo-1504888302758-9adb6780e7c8",
        "photo-1505348288055-07fa73d30043",
        "photo-1505562130589-9879683e72da",
        "photo-1505644605728-ea5ecbfef171",
        "photo-1505682499293-233fb141754c",
        "photo-1505682634904-d7c8d95cdc50",
        "photo-1506020647804-b04ee956dc04",
        "photo-1506155475929-a146afddd515",
        "photo-1506268919522-a927511962a9",
        "photo-1506305269769-53a5714a93be",
        "photo-1506440905961-0ab11f2ed5bc",
        "photo-1507646278763-8b57d6bf6369",
        "photo-1507706132643-4b3dabbca8b3",
        "photo-1507980062492-714282f31ee0",
        "photo-1508138221679-760a23a2285b",
        "photo-1508141610389-6253d977b87e",
        "photo-1508233620467-f79f1e317a05",
        "photo-1509664158680-07c5032b51e5",
        "photo-1510279770292-4b34de9f5c23",
        "photo-1510382739061-d3f7bb547302",
        "photo-1510849090660-6c8e1908c3c9",
        "photo-1510861320402-285a6c7639ea"
        ]
}
