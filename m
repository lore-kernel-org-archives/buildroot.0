From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 23:11:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/gzip: fix musl build
In-Reply-To: <1453653149-16537-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453653149-16537-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160125231129.11691833@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 24 Jan 2016 17:32:29 +0100, Bernd Kuhls wrote:
> Inspired by http://patchwork.openembedded.org/patch/111691/
> Adding "gl_cv_func_fflush_stdin=yes" was sufficient to fix the build.
> 
> Fixes
> http://autobuild.buildroot.net/results/56d/56d926fcf8ca53cddb9106617e3b852d9c9a4eeb/
> http://autobuild.buildroot.net/results/4b5/4b5a6196b686030cf7fa9706508fd99f81a81049/
> http://autobuild.buildroot.net/results/568/568c1c05800d6bdd6457845e998a598e354afdfd/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/gzip/gzip.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
