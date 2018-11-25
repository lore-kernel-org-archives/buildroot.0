From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Nov 2018 09:39:36 +0100
Subject: [Buildroot] [PATCH/next 1/1] keepalived: fix build with uclibc
In-Reply-To: <20181124212722.21388-1-fontaine.fabrice@gmail.com>
References: <20181124212722.21388-1-fontaine.fabrice@gmail.com>
Message-ID: <20181125093936.063efb4c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Nov 2018 22:27:22 +0100, Fabrice Fontaine wrote:
> Retrieve patch from upstream to fix build on uclibc
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/067ef9ae106b3e0740a70f6f9591b9da00d3da6a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...01-Rename-TIMER_MAX-to-TIMER_MAXIMUM.patch | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 package/keepalived/0001-Rename-TIMER_MAX-to-TIMER_MAXIMUM.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
