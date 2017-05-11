From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 21:14:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/openvpn: security bump to 2.4.2
In-Reply-To: <20170511165333.4655-1-bernd.kuhls@t-online.de>
References: <20170511165333.4655-1-bernd.kuhls@t-online.de>
Message-ID: <20170511211449.37278dfb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 May 2017 18:53:33 +0200, Bernd Kuhls wrote:
> Fixes CVE-2017-7478 & CVE-2017-7479:
> https://community.openvpn.net/openvpn/wiki/QuarkslabAndCryptographyEngineerAudits
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/openvpn/openvpn.hash | 2 +-
>  package/openvpn/openvpn.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks. Peter: wanted for LTS!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
