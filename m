From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 13:54:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/sslh: fix static build with pcre
In-Reply-To: <20201015060901.137916-1-fontaine.fabrice@gmail.com>
References: <20201015060901.137916-1-fontaine.fabrice@gmail.com>
Message-ID: <20201015135430.400d62ae@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 15 Oct 2020 08:09:01 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix static build failure with sslh version 1.19b and above
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a601824fc0c205a6a940e0f9f079ce2c39840605
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...akefile-fix-static-linking-with-pcre.patch | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/sslh/0001-Makefile-fix-static-linking-with-pcre.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
