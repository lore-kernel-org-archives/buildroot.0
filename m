From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Jun 2020 21:35:53 +0200
Subject: [Buildroot] [PATCH] package/iproute2: order after libcap and
 selinux
In-Reply-To: <20200605225555.13679-1-nolange79@gmail.com>
References: <20200605225555.13679-1-nolange79@gmail.com>
Message-ID: <20200606213553.525a1c01@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  6 Jun 2020 00:55:54 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> the configuration will automatically detect
> if libcap / selinux is available.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/iproute2/iproute2.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied to master with a tweaked commit title, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
