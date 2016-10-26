From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Oct 2016 14:08:23 +0200
Subject: [Buildroot] [PATCH v2 1/2] kvm-unit-tests: Fix x86_64 to use
 host compiler
In-Reply-To: <20161026031916.17158-1-cyrilbur@gmail.com>
References: <20161026031916.17158-1-cyrilbur@gmail.com>
Message-ID: <20161026140823.6fc0c0ad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Oct 2016 14:19:15 +1100, Cyril Bur wrote:

> +#Use HOSTCC for x86_64 as we'll need to compile 32bit code
> +#which buildroot cross compilers often can't do

I've reworked this comment a bit, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
