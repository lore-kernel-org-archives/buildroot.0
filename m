From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2020 21:59:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/kexec: fix build with gcc 10
In-Reply-To: <20200913165123.2685199-1-fontaine.fabrice@gmail.com>
References: <20200913165123.2685199-1-fontaine.fabrice@gmail.com>
Message-ID: <20200913215917.06abafed@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 13 Sep 2020 18:51:23 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/89b6337db9efc55aaa422fc9964f942b6d4cd5f7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ove-duplicated-variable-declarations.patch | 102 ++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 package/kexec/0002-kexec-tools-Remove-duplicated-variable-declarations.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
