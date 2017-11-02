From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 23:06:05 +0100
Subject: [Buildroot] [PATCH 2/2] dhcpcd: add systemd start-up service
In-Reply-To: <20171031223659.6831-3-code@mmayer.net>
References: <20171031223659.6831-1-code@mmayer.net>
 <20171031223659.6831-3-code@mmayer.net>
Message-ID: <20171102230605.6edbeed6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 31 Oct 2017 15:36:59 -0700, Markus Mayer wrote:
> From: Markus Mayer <mmayer@broadcom.com>
> 
> Add systemd start-up configuration for dhcpcd that is executed after
> the network has been brought up.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  package/dhcpcd/dhcpcd.mk      |  8 ++++++++
>  package/dhcpcd/dhcpcd.service | 13 +++++++++++++
>  2 files changed, 21 insertions(+)
>  create mode 100644 package/dhcpcd/dhcpcd.service

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
