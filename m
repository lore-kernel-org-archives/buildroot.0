From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 23:33:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/glibc: add upstream patch to
 fix glibc-2.23 compile bug with gcc6
In-Reply-To: <1461527505-9158-1-git-send-email-bernd.kuhls@t-online.de>
References: <1461527505-9158-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160424233302.7f168eea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Apr 2016 21:51:45 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/glibc/2.23/0002-gcc6.patch | 88 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 package/glibc/2.23/0002-gcc6.patch

To be honest, I hesitated a bit on this one. gcc6 is not released yet,
so it seems weird to already start carrying patches for it. But
according to https://gcc.gnu.org/ml/gcc/2016-04/msg00103.html, the
release of gcc 6 is imminent now, so it makes sense to start getting
patches for it.

So I've applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
