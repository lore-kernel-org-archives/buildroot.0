From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 08 Sep 2010 16:29:15 +0200
Subject: [Buildroot] mdev handling
In-Reply-To: <AANLkTi=XLJvtakS=nKMYyybTJdtoVvgaA3NFkBSMivHu@mail.gmail.com>
	(Yegor Yefremov's message of "Wed, 8 Sep 2010 16:07:52 +0200")
References: <AANLkTi=XLJvtakS=nKMYyybTJdtoVvgaA3NFkBSMivHu@mail.gmail.com>
Message-ID: <87occ8cnr8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:

 Yegor> AFAIK mdev activation leads only to adding this binary to the rootfs
 Yegor> tree. What about starting script? Would it make sense to create
 Yegor> /etc/init.d/S1mdev with the following content:

 Yegor> tmpfs           /dev           tmpfs    size=1M          0      0

 Yegor> added. (The size should be much smaller, this is only for testing)

 Yegor> What do you think about this?

Isn't this largely obsolete now we have devtmpfs?

-- 
Bye, Peter Korsgaard
