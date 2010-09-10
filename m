From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 10 Sep 2010 09:51:43 +0200
Subject: [Buildroot] mdev handling
In-Reply-To: <AANLkTinEhbNCj-GXSRzrsRRSLQw10XYNkmCua=i5GMPs@mail.gmail.com>
	(Yegor Yefremov's message of "Fri, 10 Sep 2010 09:40:49 +0200")
References: <AANLkTi=XLJvtakS=nKMYyybTJdtoVvgaA3NFkBSMivHu@mail.gmail.com>
	<87occ8cnr8.fsf@macbook.be.48ers.dk>
	<AANLkTikYk3m7bJXa4r6yY3CEW6xOxhtr9w2Ea62=WhZv@mail.gmail.com>
	<20100909121902.0b5c3bc7@surf>
	<AANLkTinEhbNCj-GXSRzrsRRSLQw10XYNkmCua=i5GMPs@mail.gmail.com>
Message-ID: <87mxrqave8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:

Hi,

 Yegor> udev has dependency BUSYBOX_SHOW_OTHERS. Is it because of mdev?

Yes, mdev is a "replacement" of udev. This is done for a number of
packages. You can argue about udev/mdev, as mdev doesn't have the same
user interface as udev, but that's how it is today atleast.
-- 
Bye, Peter Korsgaard
