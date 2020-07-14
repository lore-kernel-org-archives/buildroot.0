From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 15:24:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/libfribidi: bump to version
 1.0.9
In-Reply-To: <20200628102313.268227-1-fontaine.fabrice@gmail.com>
References: <20200628102313.268227-1-fontaine.fabrice@gmail.com>
Message-ID: <20200714152405.6fd5bfb2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 28 Jun 2020 12:23:13 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version)
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ..._level-to-FRIBIDI_BIDI_MAX_EXPLICIT_.patch | 30 -------------------
>  package/libfribidi/libfribidi.hash            |  4 +--
>  package/libfribidi/libfribidi.mk              |  4 +--
>  3 files changed, 4 insertions(+), 34 deletions(-)
>  delete mode 100644 package/libfribidi/0001-Truncate-isolate_level-to-FRIBIDI_BIDI_MAX_EXPLICIT_.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
