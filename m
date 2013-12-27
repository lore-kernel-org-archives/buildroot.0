From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Dec 2013 19:55:59 +0100
Subject: [Buildroot] [PATCH] qt5base: restore posix_fallocate() patch
In-Reply-To: <1388150843-15972-1-git-send-email-fatih.asici@gmail.com>
References: <1388150843-15972-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <20131227195559.7429b993@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fatih A??c?,

On Fri, 27 Dec 2013 15:27:23 +0200, Fatih A??c? wrote:
> It was removed in e4a839277f7d74104e25fb4fd846f9c2bf3f9c1e.
> 
> Fixes: http://autobuild.buildroot.net/results/a24/a249b0cd5b20a2c3eee34b585cd58d4a03a9338e/
> 
> Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
> ---
>  ...-detect-posix_fallocate-at-configure-time.patch | 167 +++++++++++++++++++++
>  1 file changed, 167 insertions(+)
>  create mode 100644 package/qt5/qt5base/qt5base-0007-detect-posix_fallocate-at-configure-time.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
