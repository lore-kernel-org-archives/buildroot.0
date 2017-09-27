From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Sep 2017 22:04:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/openvpn: security bump to
 version 2.4.4
In-Reply-To: <20170927170500.13295-1-bernd.kuhls@t-online.de>
References: <20170927170500.13295-1-bernd.kuhls@t-online.de>
Message-ID: <20170927220404.7ce83bad@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Sep 2017 19:05:00 +0200, Bernd Kuhls wrote:
> Fixes CVE-2017-12166:
> https://community.openvpn.net/openvpn/wiki/CVE-2017-12166
> 
> Changelog:
> https://community.openvpn.net/openvpn/wiki/ChangesInOpenvpn24
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/openvpn/openvpn.hash | 2 +-
>  package/openvpn/openvpn.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
