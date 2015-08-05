From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Aug 2015 09:56:46 +0200
Subject: [Buildroot] [PATCH 5/9] libsigrok: depends on gcc >= 4.7
In-Reply-To: <20150804200835.GX3647@free.fr>
References: <1438711241-31792-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1438711241-31792-6-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150804200835.GX3647@free.fr>
Message-ID: <20150805095646.08a978eb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 4 Aug 2015 22:08:36 +0200, Yann E. MORIN wrote:

> Note that I have not even attempted to build it with a gcc-4.7 to
> validate. This is only a review...

I did build it with a gcc 4.7 toolchain, and it built fine. Actually,
all the patches adding the gcc version dependency have been tested with
one gcc having exactly the version of the dependency.

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
