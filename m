From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 17 Feb 2012 22:26:36 +0100
Subject: [Buildroot] [PATCH] Add Freescale MX53 support
In-Reply-To: <20120217222329.65597a18@eb-e6520> ("Eric =?utf-8?Q?B=C3=A9na?=
 =?utf-8?Q?rd=22's?= message of "Fri, 17 Feb 2012 22:23:29 +0100")
References: <1328273223-16093-1-git-send-email-mbriand@adeneo-embedded.com>
 <1329126226-23552-1-git-send-email-mbriand@adeneo-embedded.com>
 <87d39d41hr.fsf@macbook.be.48ers.dk>
 <20120217222329.65597a18@eb-e6520>
Message-ID: <878vk140dv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric B?nard <eric@eukrea.com> writes:

 Eric> Le Fri, 17 Feb 2012 22:02:40 +0100,
 Eric> Peter Korsgaard <jacmet@uclibc.org> a ?crit :
 >> The freescale git-over-http is horribly slow though :/
 >> 
 Eric> the git server is reachable here :
 Eric> git://git.freescale.com/imx/linux-2.6-imx.git

Ahh, thanks. Then it imho makes sense to use the git:// url
instead. Will change.

-- 
Bye, Peter Korsgaard
