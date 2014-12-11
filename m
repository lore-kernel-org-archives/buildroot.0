From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 21:45:25 +0100
Subject: [Buildroot] [PATCH 4/4 v4] pkg-download: check hashes for
 locally cached files
In-Reply-To: <0301f2d3c762f8815c7c6dc25ed5ea8307275305.1418322200.git.yann.morin.1998@free.fr>
References: <cover.1418322200.git.yann.morin.1998@free.fr>
 <0301f2d3c762f8815c7c6dc25ed5ea8307275305.1418322200.git.yann.morin.1998@free.fr>
Message-ID: <20141211214525.753542cc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 11 Dec 2014 19:24:48 +0100, Yann E. MORIN wrote:
> In some cases, upstream just update their releases in-place, without
> renaming them. When that package is updated in Buildroot, a new hash to
> match the new upstream release is included in the corresponding .hash
> file.

We could also mention the case of SourceForge sending HTML crap from
time to time, and things like that.

> Note: this does not add any overhead compared to the previous situation,
> because we were already checking hashes of localy cached files. It just

locally.

Other than that:

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
