From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 08 Dec 2019 11:15:57 +0100
Subject: [Buildroot] [PATCH v1] acsccid: needs locale
References: <20191207204042.28294-1-ps.report@gmx.net>
Message-ID: <t3vubgxrkc.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 07 Dec 2019 21:40:42 +0100 schrieb Peter Seiderer:

> Needs locale/iconv since the bump from 1.1.4 to 1.1.7 [1]
> including upstream commit [2].

Hi,

already sent patch adding libiconv as optional dependency when needed:
http://patchwork.ozlabs.org/patch/1186510/

Regards, Bernd
