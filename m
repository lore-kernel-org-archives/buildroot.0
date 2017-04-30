From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Apr 2017 22:55:15 +0200
Subject: [Buildroot] [PATCH 3/4] package/freeswitch_mod_bcg729: new
 package
In-Reply-To: <20170430201737.12821-3-bernd.kuhls@t-online.de>
References: <20170430201737.12821-1-bernd.kuhls@t-online.de>
 <20170430201737.12821-3-bernd.kuhls@t-online.de>
Message-ID: <20170430225515.70dc3edf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Apr 2017 22:17:36 +0200, Bernd Kuhls wrote:

>  DEVELOPERS                                         |  1 +
>  package/Config.in                                  |  1 +
>  package/freeswitch_mod_bcg729/Config.in            |  9 +++++++
>  .../freeswitch_mod_bcg729.hash                     |  2 ++
>  .../freeswitch_mod_bcg729/freeswitch_mod_bcg729.mk | 30 ++++++++++++++++++++++

I think I'd prefer if the package was named freeswitch-mod-bcg729.
Indeed, we use - more frequently as the separator in package names
(python-*, lua-*, etc.).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
