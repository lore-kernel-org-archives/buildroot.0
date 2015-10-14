From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 23:53:44 +0200
Subject: [Buildroot] [PATCH] guile: handle readline support explicitly
In-Reply-To: <1444858956-1045-1-git-send-email-gustavo@zacarias.com.ar>
References: <1444858956-1045-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151014235344.6d3d9946@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 14 Oct 2015 18:42:36 -0300, Gustavo Zacarias wrote:
> Otherwise the host readline (+ncurses) development files can poison the
> build causing breakage. Fixes:
> http://autobuild.buildroot.net/results/d0a/d0a8ad9d3f19592e06df36408d6af745f7908165/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/guile/guile.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
