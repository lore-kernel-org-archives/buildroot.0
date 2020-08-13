From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 22:54:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/domoticz: fix build with boost
 1.73.0
In-Reply-To: <20200810100414.761870-1-fontaine.fabrice@gmail.com>
References: <20200810100414.761870-1-fontaine.fabrice@gmail.com>
Message-ID: <20200813225416.07f3428b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 10 Aug 2020 12:04:14 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/3607112343af24df6ca7bafc660cb5c4927c9008
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ind-placeholders-in-global-namespace.patch | 843 ++++++++++++++++++
>  1 file changed, 843 insertions(+)
>  create mode 100644 package/domoticz/0002-Avoid-deprecated-bind-placeholders-in-global-namespace.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
