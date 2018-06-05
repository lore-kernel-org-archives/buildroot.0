From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 22:10:10 +0200
Subject: [Buildroot] [PATCH 1/1] oprofile: fix musl build
In-Reply-To: <20180605182057.2264-1-fontaine.fabrice@gmail.com>
References: <20180605182057.2264-1-fontaine.fabrice@gmail.com>
Message-ID: <20180605221010.3e3add9a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Jun 2018 20:20:57 +0200, Fabrice Fontaine wrote:
> Add patch to replace undeclared basename call by op_basename
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/39ba30f4ec94e176e3d5d5b5ced37a0aa030cc5a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...archive-replace-basename-with-op_basename.patch | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/oprofile/0002-oparchive-replace-basename-with-op_basename.patch

Applied to master, thanks. Please don't forget to submit the patch
upstream. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
