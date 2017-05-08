From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 May 2017 21:21:36 +0200
Subject: [Buildroot] Buildroot defconfig failures
In-Reply-To: <bcb5bdd6-08a2-4782-70f4-0a4db45c41ab@c-sky.com>
References: <20170507145548.336e29ad@free-electrons.com>
 <df95a70f-0e89-750f-1702-25998944fc3a@c-sky.com>
 <20170508142023.6b95ccf7@free-electrons.com>
 <bcb5bdd6-08a2-4782-70f4-0a4db45c41ab@c-sky.com>
Message-ID: <20170508212136.398b376f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 8 May 2017 21:43:40 +0800, ren_guo wrote:

> > Where will you add the hash? You can't add the hash in Buildroot for
> > custom external toolchains.  
> 
> En... I want to add a toolchain-external-csky, is that ok?

Ah, yes, good point.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
