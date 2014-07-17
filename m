From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 21:00:26 +0200
Subject: [Buildroot] [PATCH 1/1] dcron: provide init script
In-Reply-To: <1405589648-26777-1-git-send-email-alvaro.gamez@hazent.com>
References: <20140715211719.0ea2e053@free-electrons.com>
 <1405589648-26777-1-git-send-email-alvaro.gamez@hazent.com>
Message-ID: <20140717210026.58276119@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alvaro G. M,

On Thu, 17 Jul 2014 11:34:08 +0200, Alvaro G. M wrote:
> dcron doesn't create a pid file, so we run it in foreground but make
> start-stop-daemon create the pidfile and move the daemon to background.
> 
> Give it a number greater than exim's init script, so job output email
> can be sent.
> 
> Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
> ---
>  package/dcron/S90dcron | 22 ++++++++++++++++++++++
>  package/dcron/dcron.mk |  1 +
>  2 files changed, 23 insertions(+)
>  create mode 100644 package/dcron/S90dcron

Thanks, applied with the change suggested by Yann.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
