From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 25 Sep 2010 14:14:50 +0200
Subject: [Buildroot] "make menuconfig" possibly broken in git master
In-Reply-To: <AANLkTimzWbLUWA+28XdSa+28oPDHdpJnVODso_VTRv9m@mail.gmail.com>
	(=?utf-8?Q?=22Bj=C3=B8rn?= Forsman"'s message of "Sat,
	25 Sep 2010 13:21:52 +0200")
References: <AANLkTimzWbLUWA+28XdSa+28oPDHdpJnVODso_VTRv9m@mail.gmail.com>
Message-ID: <87mxr66mv9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bj?rn" == Bj?rn Forsman <bjorn.forsman@gmail.com> writes:

 Bj?rn> Hi all,
 Bj?rn> My buildroot git master tree fails to "make menuconfig" because of
 Bj?rn> "zconf.tab.c:181: error: conflicting types for ?symbol_hash?":

Strange - Could you try the the same with a recent linux kernel
(E.G. 2.6.36-rc5)?

-- 
Bye, Peter Korsgaard
