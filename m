From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 00:01:11 +0100
Subject: [Buildroot] [PATCH] uclibc: enable
 UCLIBC_HAS_STRING_GENERIC_OPT in all configs
In-Reply-To: <1415804684-17297-1-git-send-email-abrodkin@synopsys.com>
References: <1415804684-17297-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20141210000111.08086fdd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Wed, 12 Nov 2014 18:04:44 +0300, Alexey Brodkin wrote:

> Also since the option in question is default in uClibc I don't expect if
> enabled back (it was silently disabled in http://git.buildroot.net/buildroot/commit/?id=cfbf8abc33d86a0cf5c1bb3e0817a22009b7f301 on introduction of NPTL in uClibc
> by Khem Raj) it to introduce problems.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Anton Kolesov <anton.kolesov@synopsys.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Khem Raj <raj.khem@gmail.com>
> ---
>  package/uclibc/uClibc-0.9.31.config   | 2 +-
>  package/uclibc/uClibc-0.9.33.config   | 2 +-
>  package/uclibc/uClibc-snapshot.config | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

We discussed this tonight with Peter, and the general opinion is that
since the uClibc developers recommend to have this enabled, it is good
to have it, so I've just applied your patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
