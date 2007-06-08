From: Konstantin Kletschke <kletschke@synertronixx.de>
Date: Fri, 8 Jun 2007 11:51:02 +0200
Subject: [Buildroot] problem with openssh
In-Reply-To: <4668E09B.1000200@e-ml.jp>
References: <e19d85410706050700s69e06497gef032dddb6eef9c9@mail.gmail.com>
	<e19d85410706051935j42739782ndf1307022f2e9031@mail.gmail.com>
	<20070606100917.e0724deb.philippe.ney@pardes.ws>
	<e19d85410706060839l6baf072cte7a5c9c9d58b67ab@mail.gmail.com>
	<e19d85410706061235g63cadda9s364849b0737a39ec@mail.gmail.com>
	<20070606235535.ddc532ee.philippe.ney@pardes.ws>
	<4668E09B.1000200@e-ml.jp>
Message-ID: <20070608095101.GA32442@z1.synertronixx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 2007-06-08 13:52 +0900 schrieb Tomohiro Masubuchi:

> > Ive been trying to compile openssh using buildroot, and just like
> > samba, it compiles fine but any executable halts with "segmentation
> > fault".

> UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
> 
> It works fine with arm(iwmmxt), gcc-4.2.0, binutils-2.17.50.0.16,
> uClibc-0.9.29.

Sadly this does not fix the smbd/nmbd issue. I can't check the fix for
openssh, may be I install it for testing purposes.

Regards, Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
