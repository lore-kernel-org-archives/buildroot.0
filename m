From: Konstantin Kletschke <kletschke@synertronixx.de>
Date: Mon, 11 Jun 2007 14:05:23 +0200
Subject: [Buildroot] problem with openssh/samba
In-Reply-To: <466D1423.1060904@e-ml.jp>
References: <e19d85410706050700s69e06497gef032dddb6eef9c9@mail.gmail.com>
	<e19d85410706051935j42739782ndf1307022f2e9031@mail.gmail.com>
	<20070606100917.e0724deb.philippe.ney@pardes.ws>
	<e19d85410706060839l6baf072cte7a5c9c9d58b67ab@mail.gmail.com>
	<e19d85410706061235g63cadda9s364849b0737a39ec@mail.gmail.com>
	<20070606235535.ddc532ee.philippe.ney@pardes.ws>
	<4668E09B.1000200@e-ml.jp> <20070608095101.GA32442@z1.synertronixx>
	<466D1423.1060904@e-ml.jp>
Message-ID: <20070611120522.GB27209@z1.synertronixx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 2007-06-11 18:21 +0900 schrieb Tomohiro Masubuchi:

> To solve this problem, patch this attachment file to uClibc-0.9.29,
> and rebuild it.

Indeed.

> However, I am not confident about this way...

At least it makes smbd and nmbd not segfaulting at startup anymore.

Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
