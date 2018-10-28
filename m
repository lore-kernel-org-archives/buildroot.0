From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Oct 2018 17:39:30 +0100
Subject: [Buildroot] [PATCH 1/1] libkcapi: disable documentation
In-Reply-To: <20181028093953.28938-1-fontaine.fabrice@gmail.com>
References: <20181028093953.28938-1-fontaine.fabrice@gmail.com>
Message-ID: <20181028173930.7bb48579@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 Oct 2018 10:39:53 +0100, Fabrice Fontaine wrote:
> Disable db2pdf, db2ps and xmlto which are used for building PDF, PS, man
> or html documentation
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/28df3b50d90bc53b965280b77224f89fe09ec2b9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libkcapi/libkcapi.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
