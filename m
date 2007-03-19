From: Frederic Kwiatkowski <stagedrt@gmail.com>
Date: Mon, 19 Mar 2007 09:15:37 +0100
Subject: [Buildroot] AT91SAM9260-EK dev Board.
In-Reply-To: <00ea01c76815$66bd1c60$01c4af0a@Glamdring>
References: <0EC1BDC1699B7C42A43B634A17463A7701A682@VENUS.DaitoEng.com>
	<c88e466f0701100043k65779458pf360d6e4a6051fda@mail.gmail.com>
	<45B376D8.2070902@indiana.edu>
	<c88e466f0701260203n1de23d51x2a8ffb2794cdab27@mail.gmail.com>
	<5fb065d90703160611h790be65dl2c5c57e9af6cbc86@mail.gmail.com>
	<00ea01c76815$66bd1c60$01c4af0a@Glamdring>
Message-ID: <5fb065d90703190115p257f7e9du499451067c021d52@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2007/3/16, Ulf Samuelsson <ulf@atmel.com>:
> Beware, that once you add something to your root file system,
> buildroot will not remove it, even if you "remove" the package
> using make menuconfig.

I've seen it at the end of the day, so i've delete all my rootfs
directory and rebuild it
