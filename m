From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 20:28:44 +0100
Subject: [Buildroot] [PATCH] flac: bump to version 1.3.1
In-Reply-To: <1417106005-14032-1-git-send-email-gustavo@zacarias.com.ar>
References: <1417106005-14032-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141127202844.23b0497c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 27 Nov 2014 13:33:25 -0300, Gustavo Zacarias wrote:
> All patches upstream and add hash file.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/flac/0001-fix-altivec-logic.patch | 32 -------------------------
>  package/flac/0002-fix-CVE-2014-9028.patch | 34 --------------------------
>  package/flac/0003-fix-CVE-2014-8962.patch | 40 -------------------------------
>  package/flac/flac.hash                    |  2 ++
>  package/flac/flac.mk                      |  2 +-
>  5 files changed, 3 insertions(+), 107 deletions(-)
>  delete mode 100644 package/flac/0001-fix-altivec-logic.patch
>  delete mode 100644 package/flac/0002-fix-CVE-2014-9028.patch
>  delete mode 100644 package/flac/0003-fix-CVE-2014-8962.patch
>  create mode 100644 package/flac/flac.hash

Applied, thanks. I also dropped FLAC_AUTORECONF = YES, which was no
longer necessary.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
