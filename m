From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 21:52:44 +0100
Subject: [Buildroot] [PATCH 1/1] liblo: fix stringop-truncation error
 with gcc 8
In-Reply-To: <20181215220050.32220-1-fontaine.fabrice@gmail.com>
References: <20181215220050.32220-1-fontaine.fabrice@gmail.com>
Message-ID: <20181216215244.24ab7ed7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Dec 2018 23:00:50 +0100, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.org/results/62896bd6a1a30facaffd07a7a763831996dc8ea0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...rc-server.c-fix-stringop-truncation-error.patch | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/liblo/0002-src-server.c-fix-stringop-truncation-error.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
