From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Sep 2013 17:06:17 +0200
Subject: [Buildroot] [PATCH 2 of 9 v4] Config.in.legacy: update
	description for users
In-Reply-To: <20130903135209.3b1ea8f5@skate> (Thomas Petazzoni's message of
 "Tue, 3 Sep 2013 13:52:09 +0200")
References: <patchbomb.1378152469@argentina>
 <ac4d080274a06689e8d4.1378152471@argentina>
 <20130902225514.7d9323cc@skate> <52257EA4.9030001@mind.be>
 <20130903091818.616d6665@skate>
 <CAAXf6LWNRK1fZMQfMU5w52NzgyG+HL1VbXPU1o5FuFQ+eNBFEA@mail.gmail.com>
 <20130903135209.3b1ea8f5@skate>
Message-ID: <87ob8a54ie.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:


 Thomas> So far, the only problem I see with this are related to minimal
 Thomas> defconfigs. In the case (1) above, the minimal defconfig will continue
 Thomas> to contain the name of the legacy option, and not the name of the new
 Thomas> option, since the new option is selected by the legacy option. This is
 Thomas> annoying since it means minimal defconfigs are not progressively
 Thomas> updated to use the new option name. And this probably makes my entire
 Thomas> proposal moot.

Damn, yes :/

So people really do need to explictly change to the new option / restart
make menuconfig.

-- 
Bye, Peter Korsgaard
