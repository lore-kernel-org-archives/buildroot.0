From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 15:01:45 +0100
Subject: [Buildroot] [PATCH v3 04/13] package/dhcp: systemd: support
 extra options
In-Reply-To: <1445734779-7212-4-git-send-email-benoit.thebaudeau.dev@gmail.com>
References: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <1445734779-7212-4-git-send-email-benoit.thebaudeau.dev@gmail.com>
Message-ID: <20151224150145.46977af1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Sun, 25 Oct 2015 02:59:30 +0200, Beno?t Th?baudeau wrote:
> Add an OPTIONS configuration variable in order to make it possible to
> pass custom extra options to dhcpd. This keeps the systemd support
> consistent with the SysV init script.
> 
> Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com>
> 
> ---
> Changes v2 -> v3: new patch.
> ---
>  package/dhcp/dhcpd.service | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
