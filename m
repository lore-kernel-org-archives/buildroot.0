From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 May 2017 16:21:24 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/uclibc: add upstream patch
 to fix build issue with gcc7
In-Reply-To: <20170523202440.6949-1-romain.naour@gmail.com>
References: <20170523202440.6949-1-romain.naour@gmail.com>
Message-ID: <20170524162124.7d8cd4c4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 May 2017 22:24:38 +0200, Romain Naour wrote:
> As reported on the mailing list [1], there is a build issue with gcc 7
> and uClibc-ng.
> 
> Thanks to Waldemar for the fix :)
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2017-May/191140.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...es.h-with-GNU-C-library-fixes-gcc-7.1-too.patch | 64 ++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 package/uclibc/0001-sync-features.h-with-GNU-C-library-fixes-gcc-7.1-too.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
