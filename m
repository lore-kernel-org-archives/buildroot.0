From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jul 2014 13:11:23 +0200
Subject: [Buildroot] [PATCH 0/4 v3] perl-infra enhancements (branch
 yem/autobuild-perl)
In-Reply-To: <cover.1405256442.git.yann.morin.1998@free.fr>
References: <cover.1405256442.git.yann.morin.1998@free.fr>
Message-ID: <20140714131123.5837d7fa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 13 Jul 2014 15:03:20 +0200, Yann E. MORIN wrote:

> This series enhances the pkg-erl infrastructure:
>   - add possibility for packages to pass extra environment variables
>     at configure time
>   - fix perl-net-ssleay
>   - hide perl extensions written in C when doing static build

Thanks, series applied. Indeed, the thing that was preventing Fran?ois
patches from being applied is the fact that the commit logs were way
too terse, despite me asking for better commit logs.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
