From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 2 Jan 2020 09:24:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/log4cplus: fix detection of
 -latomic
In-Reply-To: <20200101175457.2524908-1-fontaine.fabrice@gmail.com>
References: <20200101175457.2524908-1-fontaine.fabrice@gmail.com>
Message-ID: <20200102092431.374c8a8b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  1 Jan 2020 18:54:57 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/5451df835e0e96545b322bc9bd74f76273ee3b34
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ure-ac-check-for-libraries-in-C-mode.patch | 62 +++++++++++++++++++
>  package/log4cplus/log4cplus.mk                |  2 +
>  2 files changed, 64 insertions(+)
>  create mode 100644 package/log4cplus/0001-configure-ac-check-for-libraries-in-C-mode.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
