From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 18:49:54 +0100
Subject: [Buildroot] [RFC: PATCH 1/3] systemd: configure DHCP via
 networkd
In-Reply-To: <1474113519-24713-2-git-send-email-eric.le.bihan.dev@free.fr>
References: <1474113519-24713-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1474113519-24713-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20170206184954.66032632@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Sep 2016 13:58:37 +0200, Eric Le Bihan wrote:
> If systemd-networkd is enabled and $BR2_SYSTEM_DHCP is set, then create
> a .network file to configure the selected network interface via DHCP.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/systemd/systemd.mk | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Applied to master, with the change I suggested a while ago (i.e
generate the file from a template).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
