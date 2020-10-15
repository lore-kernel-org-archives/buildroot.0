From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 17:58:40 +0200
Subject: [Buildroot] [PATCH v4 1/1] tpm2-tss: bump version to 3.0.1
In-Reply-To: <yb7k-xY0l_p3TTfxxlrtmwPBuBcgKRJ4AbluBXMvh1W73w6ul6tSw_Bwltz1CQlJKUIGcM_Y0T9GUpU92ttmWI1gHlw2C8VUGa-FfIaGioQ=@protonmail.com>
References: <yb7k-xY0l_p3TTfxxlrtmwPBuBcgKRJ4AbluBXMvh1W73w6ul6tSw_Bwltz1CQlJKUIGcM_Y0T9GUpU92ttmWI1gHlw2C8VUGa-FfIaGioQ=@protonmail.com>
Message-ID: <20201015175840.1e33c86a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 15 Oct 2020 09:00:13 +0000
Yair Ben-Avraham via buildroot <buildroot@busybox.net> wrote:

> - 0001-Temporary-fix-for-build-without-C.patch, AC_PROG_CXX line
>   number changed.
> - Makefile-fuzz-generated.am now in size zero.
> - json-c, libcurl: new (FAPI) dependencies since tpm2-tss version 2.4.0
> 
> Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
> ---
>  ...01-Temporary-fix-for-build-without-C.patch | 14 +++++++-----
>  package/tpm2-tss/Config.in                    | 22 +++++++++++++++++++
>  package/tpm2-tss/tpm2-tss.hash                |  4 ++--
>  package/tpm2-tss/tpm2-tss.mk                  | 16 ++++++--------
>  4 files changed, 39 insertions(+), 17 deletions(-)

Applied to master after fixing the issues I had pointed out in my other
e-mail reviewing this v4.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
