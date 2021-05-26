From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Wed, 26 May 2021 22:56:33 +0300
Subject: [Buildroot] [PATCH/next 0/2] Enable more openssl features for
 hostapd/wpa_supplicant
Message-ID: <20210526195635.127744-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

One more openssl crypto feature needs to be enabled for hostapd
and wpa_supplicant. Last time it was MD4, now it is DES.

Regards,
Sergey

Sergey Matyukevich (2):
  package/wpa_supplicant: enable DES in openssl
  package/hostapd: enable DES in openssl

 package/hostapd/Config.in        | 1 +
 package/wpa_supplicant/Config.in | 1 +
 2 files changed, 2 insertions(+)

-- 
2.31.1
