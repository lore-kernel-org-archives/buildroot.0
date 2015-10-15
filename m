From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Oct 2015 09:40:45 +0200
Subject: [Buildroot] [PATCH] pango: remove initscript
In-Reply-To: <1444871493-6802-1-git-send-email-gustavo@zacarias.com.ar>
References: <1444871493-6802-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151015094045.53d82965@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 14 Oct 2015 22:11:33 -0300, Gustavo Zacarias wrote:
> pango-querymodules is deprecated/removed, so ditch the initscript.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/pango/S25pango | 20 --------------------
>  package/pango/pango.mk |  5 -----
>  2 files changed, 25 deletions(-)
>  delete mode 100644 package/pango/S25pango

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
