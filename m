From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 22:57:13 +0200
Subject: [Buildroot] [PATCH] package/mkpasswd: expose the host variant
 in menuconfig
In-Reply-To: <1475859551-23466-1-git-send-email-yann.morin.1998@free.fr>
References: <1475859551-23466-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20161007225713.1d02e96c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  7 Oct 2016 18:59:11 +0200, Yann E. MORIN wrote:
> Some people may need it to generate passwords (not necessarily for
> users) from post-build scripts.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/Config.in.host          | 1 +
>  package/mkpasswd/Config.in.host | 2 ++
>  2 files changed, 3 insertions(+)
>  create mode 100644 package/mkpasswd/Config.in.host

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
