From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Mar 2021 21:59:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: fix zkey build
In-Reply-To: <20210322074442.1112603-1-fontaine.fabrice@gmail.com>
References: <20210322074442.1112603-1-fontaine.fabrice@gmail.com>
Message-ID: <20210330215949.339274e5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Mar 2021 08:44:42 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Build of zkey fails since bump to version 2.16.0 in commit
> b82b58a8ddc3d079aa2976b3dafbc965b6107648
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e7f229a98dab188ee9c40e4709fd26bfa67358d3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...en-the-compiler-flags-are-overridden.patch | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 package/s390-tools/0002-zkey-Fix-build-error-when-the-compiler-flags-are-overridden.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
