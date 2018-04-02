From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 02 Apr 2018 14:03:48 +0200
Subject: [Buildroot] [PATCH 1/2] package/libressl: bump version to 2.7.2
References: <20180402083708.21199-1-bernd.kuhls@t-online.de>
 <87tvstor9g.fsf@dell.be.48ers.dk>
Message-ID: <4qi9pexjon.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 02 Apr 2018 12:07:55 +0200 schrieb Peter Korsgaard:

> So a number of packages earlier not compatible with libressl may now
> work.

Hi Peter,

true, sent patches for ffmpeg, libevent, opusfile, openldap and ntp.

The following packages still do not build with libressl: mosquitto, 
libpjsip, softether, wpa_supplicant and hostapd.

Regards, Bernd
