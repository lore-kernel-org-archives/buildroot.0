From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 23:54:02 +0200
Subject: [Buildroot] [PATCH v2] Makefile: save MAKE_VERSION
In-Reply-To: <1436909439-8176-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436909439-8176-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150714235402.1d482401@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 14 Jul 2015 18:30:39 -0300, Gustavo Zacarias wrote:
> Save MAKE_VERSION as RUNNING_MAKE_VERSION since this is later clobbered
> by the make package.
> 
> It will be used by the webkitgtk24 package to check for older make
> versions which have a bug building it with parallel jobs (it hangs).
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  Makefile | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
