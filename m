From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Nov 2015 00:01:42 +0100
Subject: [Buildroot] [PATCH] docs/manual: document $(FOO_PKGDIR)
In-Reply-To: <1446675083-22426-1-git-send-email-yann.morin.1998@free.fr>
References: <1446675083-22426-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20151105000142.39e7475f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed,  4 Nov 2015 23:11:23 +0100, Yann E. MORIN wrote:
> In the manual, add a note that packages can use $(FOO_PKGDIR) to get the
> path to the directory containg the .mk and Config.in files, if they need
> it to e.g. copy files from there, like startup scripts, systemd units or
> any other resource.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> ---
> Changes:
>   - split out of the series since the corresponding code has been
>     applied
> ---
>  docs/manual/adding-packages-generic.txt | 5 +++++
>  1 file changed, 5 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
