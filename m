From: =?utf-8?B?0JvRg9C60YzRj9C90YfRg9C6INCQ0LvQtdC60YHQtdC5?= <skif@skif-web.ru>
Date: Fri, 13 Dec 2019 15:45:51 +0300
Subject: [Buildroot] mariadb: inrorrect behavio of mariadb_config
Message-ID: <10576581576241151@sas2-e9d1d6a5422a.qloud-c.yandex.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, Ryan!

inrorrect behavior observed by using mysql_config from mariadb package

if mariadb_config exists in system we get out host root paths instead of required sysroot paths

this is fixed by removing mariadb_config from sysroot?

could you please comment this ?


--?
Regards,
Alexey Lukyanchuk
skif at skif-web.ru
