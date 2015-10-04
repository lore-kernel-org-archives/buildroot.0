From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 18:58:07 +0100
Subject: [Buildroot] [PATCH] webkitgtk24: fix compilation failure due to
 unicode quotes
In-Reply-To: <1441195730-38798-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1441195730-38798-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151004185807.263ed91c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 2 Sep 2015 13:08:50 +0100, Vicente Olivert Riera wrote:
> As reported in this upstream bug...
> 
> https://bugs.webkit.org/show_bug.cgi?id=128971
> 
> ...the pretty unicode double quotes break Python stdin. Backporting the
> patch that was attached to that bug report and tweak it minimally to
> make it apply on Buildroot.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/c8e/c8ea1cab0a1ee081f9bca994ff5309ea0117d692/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  ...etty-quotes-in-licence-break-Python-stdin.patch |   36 ++++++++++++++++++++
>  1 files changed, 36 insertions(+), 0 deletions(-)
>  create mode 100644 package/webkitgtk24/0003-Pretty-quotes-in-licence-break-Python-stdin.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
