From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 23:09:28 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/oprofile: bump to version
 1.4.0
In-Reply-To: <20200829202905.2864307-1-fontaine.fabrice@gmail.com>
References: <20200829202905.2864307-1-fontaine.fabrice@gmail.com>
Message-ID: <20200829230928.012018ca@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 29 Aug 2020 22:29:05 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop third patch (already in version) and so drop second patch and
>   autoreconf
> - Update indentation in hash file (two spaces)
> 
> https://oprofile.sourceforge.io/release-notes/oprofile-1.4.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...d-foreign-option-to-AM_INIT_AUTOMAKE.patch |  36 ----
>  ...o-handle-the-binutils-2.34-api-chang.patch | 169 ------------------
>  package/oprofile/oprofile.hash                |   8 +-
>  package/oprofile/oprofile.mk                  |   5 +-
>  4 files changed, 5 insertions(+), 213 deletions(-)
>  delete mode 100644 package/oprofile/0002-configure.ac-add-foreign-option-to-AM_INIT_AUTOMAKE.patch
>  delete mode 100644 package/oprofile/0003-Macro-wrappers-to-handle-the-binutils-2.34-api-chang.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
