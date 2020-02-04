From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 4 Feb 2020 23:20:04 +0100
Subject: [Buildroot] [PATCH] package/libxml2: add upstream security fix
 for CVE-2020-7595
In-Reply-To: <20200204154148.23603-1-peter@korsgaard.com>
References: <20200204154148.23603-1-peter@korsgaard.com>
Message-ID: <20200204232004.772848dc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  4 Feb 2020 16:41:47 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes CVE-2020-7595: xmlStringLenDecodeEntities in parser.c in libxml2
> 2.9.10 has an infinite loop in a certain end-of-file situation.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...e-loop-in-xmlStringLenDecodeEntities.patch | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/libxml2/0001-Fix-infinite-loop-in-xmlStringLenDecodeEntities.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
