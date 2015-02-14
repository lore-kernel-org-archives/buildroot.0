From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 09:59:42 +0100
Subject: [Buildroot] [PATCH 0/10 v7] NVidia GPU binary blobs for x86 and
 ARM (branch yem/gfx2)
In-Reply-To: <cover.1423597914.git.yann.morin.1998@free.fr>
References: <cover.1423597914.git.yann.morin.1998@free.fr>
Message-ID: <20150214095942.6ed310e3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 10 Feb 2015 21:01:12 +0100, Yann E. MORIN wrote:

>       package/python-lxml: new host package
>       package/python-lxml: add target variant

Since the host variant of python-lxml is no longer needed, I've
squashed those two patches together, kept only the target variant
code, and applied the result to the next branch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
