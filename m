From: Juha Rantanen <juha@codercoded.com>
Date: Wed, 30 Dec 2015 13:33:22 +0200
Subject: [Buildroot] [PATCH 0/1] ACS CCID PC/SC Driver
Message-ID: <1451475203-23925-1-git-send-email-juha@codercoded.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This is my first patch, hope I did everything right. My device I tested with
is ACR122U USB NFC Reader on RPi 2 but the driver should support a lot of ACS
readers.

I wasn't sure whether this belongs in "Hardware handling" or
"Libraries/Hardware handling" and also not sure if flex and perl are needed
only on build.

Source: https://github.com/acshk/acsccid

Juha Rantanen (1):
  ACS CCID PC/SC Driver added.

 package/Config.in          |  1 +
 package/acsccid/Config.in  | 11 +++++++++++
 package/acsccid/acsccid.mk | 14 ++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/acsccid/Config.in
 create mode 100644 package/acsccid/acsccid.mk

-- 
2.1.4
