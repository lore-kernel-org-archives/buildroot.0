From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 12:21:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/lcdproc: fix musl build
In-Reply-To: <1454167019-24428-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454167019-24428-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160207122157.6b56ddf4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 30 Jan 2016 16:16:59 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/9ce/9cec3bea99f2aa10313da38c1e81655666c774f7/
> http://autobuild.buildroot.net/results/b3d/b3d09286d018e53a6d57f8dd5616010a3b212731/
> http://autobuild.buildroot.net/results/aa2/aa27b150a79b14fe1dda74a56371b4ee35b3ac15/
> and others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/lcdproc/0002-musl.patch | 102 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 package/lcdproc/0002-musl.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
