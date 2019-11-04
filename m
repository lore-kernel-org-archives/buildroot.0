From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 04 Nov 2019 22:38:35 +0100
Subject: [Buildroot] [PATCH 1/2] package/libnftnl: bump version to 1.1.4
References: <20191104073822.16542-1-bernd.kuhls@t-online.de>
 <20191104220828.202cbe33@windsurf.home>
Message-ID: <rbi69gxcp2.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 04 Nov 2019 22:08:28 +0100 schrieb Thomas Petazzoni:

> Both applied. Thanks!

Hi Thomas,

two problems exist here, first: You did not commit my patch as of
1a94bd8e6ffaf5a7e3dd43320a025e3fb7992229, but more importantly I missed 
the fact that I submitted this version bump already back in August with 
an even better version ;) 

So please pick patch 1156174 instead:
http://patchwork.ozlabs.org/project/buildroot/list/?
series=&submitter=62613&state=*&q=libnftnl&archive=&delegate=

Not bumping this package will cause build errors with nftables because 
the bumped version requires libnftnl >= 1.1.4.

Regards, Bernd
