From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Oct 2015 23:12:55 +0200
Subject: [Buildroot] [PATCH 1/4] configs/raspberrypi: use EABIhf
In-Reply-To: <87k2qn6gf0.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Thu, 15 Oct 2015 22:11:15 +0200")
References: <20150820143005.GA6441@ketchup.mtl.sfl>
 <1440273688-92868-1-git-send-email-benoit@wsystem.com>
 <20151012235935.6a195741@free-electrons.com>
 <87k2qn6gf0.fsf@dell.be.48ers.dk>
Message-ID: <87k2qn4yzs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
 > Hi,

 >> Applied, thanks. I actually believe we should be doing the same for all
 >> ARMv6/ARMv7 platforms, except if there is a specific issue with using
 >> EABIhf (such as existing pre-built binaries that are EABI only).

 >> Maybe we should even use EABIhf by default on ARMv6+.

 > Agreed!

Only potential disadvantage is that we currently don't have any
preconfigured external ARMv6 EABIhf toolchains :/

-- 
Bye, Peter Korsgaard
