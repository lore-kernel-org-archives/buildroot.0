From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Sep 2010 14:00:07 +0200
Subject: [Buildroot] mdev handling
In-Reply-To: <AANLkTikGk1E9g_ve1kHzH9FQLLVFnLQFNANuXCymWK3W@mail.gmail.com>
References: <AANLkTi=XLJvtakS=nKMYyybTJdtoVvgaA3NFkBSMivHu@mail.gmail.com>
	<87occ8cnr8.fsf@macbook.be.48ers.dk>
	<AANLkTikYk3m7bJXa4r6yY3CEW6xOxhtr9w2Ea62=WhZv@mail.gmail.com>
	<20100909121902.0b5c3bc7@surf>
	<AANLkTikGk1E9g_ve1kHzH9FQLLVFnLQFNANuXCymWK3W@mail.gmail.com>
Message-ID: <20100909140007.6f3d0874@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 9 Sep 2010 12:38:13 +0200
Yegor Yefremov <yegorslists@googlemail.com> wrote:

> What should "Using devtmfs" make? Enable/disable this option in
> kernel?

Yes, probably, and make sure that devtmpfs is mounted as needed
(/etc/fstab).

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
