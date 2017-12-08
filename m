From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Dec 2017 14:18:27 +0100
Subject: [Buildroot] [PATCH 5/8] mv-ddr-marvell: new package
In-Reply-To: <87r2s5z8zj.fsf@dell.be.48ers.dk>
References: <20171203214811.3124-1-thomas.petazzoni@free-electrons.com>
 <20171203214811.3124-6-thomas.petazzoni@free-electrons.com>
 <87r2s5z8zj.fsf@dell.be.48ers.dk>
Message-ID: <20171208141827.093390e6@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 08 Dec 2017 13:42:40 +0100, Peter Korsgaard wrote:

> I wonder if it would make sense to  depend or / select atf, but I've
> left it as is for now and committed, thanks.

I don't really have a strong opinion here (though I'm leaning towards
the depends on). However, if you change this, then we should also change
the vexpress-firmware package.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
