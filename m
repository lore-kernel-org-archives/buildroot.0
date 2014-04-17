From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 21:50:35 +0200
Subject: [Buildroot] [PATCH] qt5script: Check for QtGui before building
 the examples
In-Reply-To: <1397750187-33936-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1397750187-33936-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20140417215035.573dc994@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 17 Apr 2014 16:56:27 +0100, Vicente Olivert Riera wrote:
> Adding an upstream patch to fix an autobuild failure.
> 
> qsdbg and marshal examples need QtGui module. If QtGui is not installed
> they fail to compile.
> 
> Upstream commit:
>    https://github.com/qtproject/qtscript/commit/e4453c92ee41943a3a1d67a725804a44e747f64e
> 
> Fixes:
>    http://autobuild.buildroot.net/results/0e6/0e63bc604f3ec422996eb0f5fd92f4437954ca04/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  ...ck-for-QtGui-before-building-the-examples.patch |   46 ++++++++++++++++++++
>  1 files changed, 46 insertions(+), 0 deletions(-)
>  create mode 100644 package/qt5/qt5script/qt5script-0001-Check-for-QtGui-before-building-the-examples.patch

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
