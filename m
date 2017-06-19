From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Jun 2017 22:15:14 +0200
Subject: [Buildroot] [PATCH] ntp: enable/disable sntp support depending
 on BR2_PACKAGE_NTP_SNTP
In-Reply-To: <20170619143325.19089-1-Vincent.Riera@imgtec.com>
References: <20170619143325.19089-1-Vincent.Riera@imgtec.com>
Message-ID: <20170619221514.50a2b49c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Jun 2017 15:33:25 +0100, Vicente Olivert Riera wrote:
> We already have an option for selecting sntp support in ntp that can be
> chosen from the menuconfig, and ntp's configure script has a --with-sntp
> option (with its --without counterpart) which can be used for disabling
> sntp support in ntp. However, we are not using it. This patch will make
> use of it.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/ntp/ntp.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
