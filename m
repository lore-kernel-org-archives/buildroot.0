From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 22:13:07 +0100
Subject: [Buildroot] [PATCH] dhcp: add systemd service file
In-Reply-To: <1410815083-11776-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1410815083-11776-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20141026221307.60bc5ffa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Mon, 15 Sep 2014 23:04:43 +0200, Eric Le Bihan wrote:
> Add a systemd service file to start dhcpd.
> 
> The network interfaces to listen on can be set via the variable
> INTERFACES in /etc/default/dhcpd.conf. Example:
> 
>   INTERFACES="eth0 eth1"
> 
> Also install a tmpfiles.d file to create /var/lib/dhcp/dhcpd.leases
> (needed at dhcpd start-up).
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/dhcp/dhcp.mk       | 15 +++++++++++++++
>  package/dhcp/dhcpd.service | 13 +++++++++++++
>  2 files changed, 28 insertions(+)
>  create mode 100644 package/dhcp/dhcpd.service

What is the status of this patch? Yann made some comments, which
apparently you agreed on. Is a new version of the patch needed?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
