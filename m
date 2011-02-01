From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Feb 2011 08:45:01 +0100
Subject: [Buildroot] [uclinux-dist-devel] [PATCH] buildroot:package:
	Remove configure target parameter in Makefile.autotools.in
In-Reply-To: <AANLkTikMtTC3zOWCOQDLGWpv3h=-rUiQwVa4fAN07rBM@mail.gmail.com>
	(Sonic Zhang's message of "Tue, 1 Feb 2011 12:43:23 +0800")
References: <1296532330-24961-1-git-send-email-sonic.adi@gmail.com>
	<AANLkTi=F8BRtskBBKE_Wno=Vy=EHvLjE3bkYagiAuegH@mail.gmail.com>
	<AANLkTikMtTC3zOWCOQDLGWpv3h=-rUiQwVa4fAN07rBM@mail.gmail.com>
Message-ID: <87vd14urk2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sonic" == Sonic Zhang <sonic.adi@gmail.com> writes:

 Sonic> Some autotools based software packages generate prefix name to the
 Sonic> binary after running install if you set --target parameter.

 Sonic> For example:

 Sonic> --target=arm

 Sonic> rcp is rename to "linux-arm-rcp" after running install

These packages typically accept the configure options
--program-transform-name to make them not do that.

-- 
Bye, Peter Korsgaard
