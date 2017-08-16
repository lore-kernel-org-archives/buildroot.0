From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Aug 2017 23:15:32 +0200
Subject: [Buildroot] [PATCH v2] gst1-validate: disable building
 documentation using sphinx
In-Reply-To: <20170812210610.536-1-arnout@mind.be>
References: <20170812210610.536-1-arnout@mind.be>
Message-ID: <20170816231532.092f66f5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Aug 2017 23:06:10 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> From: Peter Seiderer <ps.report@gmx.net>
> 
> Fix a build failure in case (a non functional) sphinx documentation
> system is installed on the host (reported [1] and fix tested [2]
> by grunpferd at netscape.net).
> 
> Fixes:
> 
>   sphinx-build -b html -d ./doctrees   . ./html
>   Error: Source directory doesn't contain a conf.py file.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2017-August/200021.html
> [2] http://lists.busybox.net/pipermail/buildroot/2017-August/200267.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> Cc: grunpferd at netscape.net
> [Arnout:
>  - use --disable-sphinx-doc instead of a cv variable
>  - remove the comment, it speaks for itself]
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/gstreamer1/gst1-validate/gst1-validate.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
