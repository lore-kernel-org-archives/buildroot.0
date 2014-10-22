From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2014 18:07:59 +0200
Subject: [Buildroot] [PATCH] openswan: bump to version 2.6.42
In-Reply-To: <1413977297-17768-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413977297-17768-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141022180759.244dcfb0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 22 Oct 2014 08:28:17 -0300, Gustavo Zacarias wrote:
> Add hash file.
> Patch upstream in common Makefile.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/openswan/openswan-01-gcc-detection.patch | 43 ------------------------
>  package/openswan/openswan.hash                   |  2 ++
>  package/openswan/openswan.mk                     |  2 +-
>  3 files changed, 3 insertions(+), 44 deletions(-)
>  delete mode 100644 package/openswan/openswan-01-gcc-detection.patch
>  create mode 100644 package/openswan/openswan.hash

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
