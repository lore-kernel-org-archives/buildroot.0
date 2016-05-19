From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 19 May 2016 08:35:32 +0200
Subject: [Buildroot] [PATCH] libxml2: fix static build with xz
References: <83a61efc9b5c0ed716172544323ed519c8926902.1459187689.git.baruch@tkos.co.il>
Message-ID: <ke301dx2eg.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 28 Mar 2016 20:54:49 +0300 schrieb Baruch Siach:

> Add a patch that adds '-llzma' to the output of 'xml2-config --libs'
> when xz is enabled. This fixes static build when xz is enabled.

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(compile-tested http://autobuild.buildroot.net/
results/6db/6db405a097b192876c0b1b8d59051d614563c617/defconfig)
