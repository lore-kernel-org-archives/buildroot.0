From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Oct 2014 21:42:46 +0100
Subject: [Buildroot] [PATCH 2/2] cryptsetup: bump to version 1.6.6
In-Reply-To: <1414598495-31088-2-git-send-email-gustavo@zacarias.com.ar>
References: <1414598495-31088-1-git-send-email-gustavo@zacarias.com.ar>
 <1414598495-31088-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141029214246.70bdcca6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 29 Oct 2014 13:01:35 -0300, Gustavo Zacarias wrote:
> Drop upstream patch, add hash file, switch to kernel.org mirror.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...ryptsetup-0002-mkdir.patch => 0001-mkdir.patch} |  0
>  ...p-0001-link-against-lrt-for-clock_gettime.patch | 33 ----------------------
>  package/cryptsetup/cryptsetup.hash                 |  2 ++
>  package/cryptsetup/cryptsetup.mk                   |  7 +++--
>  4 files changed, 6 insertions(+), 36 deletions(-)
>  rename package/cryptsetup/{cryptsetup-0002-mkdir.patch => 0001-mkdir.patch} (100%)
>  delete mode 100644 package/cryptsetup/cryptsetup-0001-link-against-lrt-for-clock_gettime.patch
>  create mode 100644 package/cryptsetup/cryptsetup.hash

Applied, thanks. If you have some time, it would be great to push
0001-mkdir.patch upstream, so that we can drop AUTORECONF = YES at some
point in the future.

Thanks a lot:

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
