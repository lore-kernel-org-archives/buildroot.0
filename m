From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 22 May 2021 23:22:29 +0300
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: enable MD4 in
 openssl
In-Reply-To: <20210522201209.642371-1-geomatsi@gmail.com>
References: <20210522201209.642371-1-geomatsi@gmail.com>
Message-ID: <YKloBcQ5BJLigspv@curiosity>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hostapd/wpa_supplicant crypto backend assumes that openssl always
> provides MD4 support. However MD4 support in openssl has become
> optional since  commit a83d41867c8d ("package/libopenssl: add
> option to enable some features").
> 
> Select openssl MD4 support in wpa_supplicant Kconfig to avoid
> build failures.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

This patch is for 'next', not for 'master'.

Regards,
Sergey
