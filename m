From: Vassil Kolarov <vas@vas.io>
Date: Thu, 19 Jan 2017 15:06:20 +0000
Subject: [Buildroot] [PATCH 0/1] New package - pigpio
Message-ID: <20170119150621.10390-1-vas@vas.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I see a lot of people are looking to add pigpio when building RPi firmware, but no official buildroot package yet, so here is my proposal.
I splitted the python module into a separate optional package as it may not be needed in some (many) cases.

Regards,
Vasco

Vassil Kolarov (1):
  added new package pigpio

 package/Config.in                      |  2 ++
 package/pigpio/0001-Makefile.patch     | 36 ++++++++++++++++++++++++++++++++++
 package/pigpio/Config.in               |  6 ++++++
 package/pigpio/pigpio.mk               | 20 +++++++++++++++++++
 package/python-pigpio/Config.in        | 12 ++++++++++++
 package/python-pigpio/python-pigpio.mk | 13 ++++++++++++
 6 files changed, 89 insertions(+)
 create mode 100644 package/pigpio/0001-Makefile.patch
 create mode 100644 package/pigpio/Config.in
 create mode 100644 package/pigpio/pigpio.mk
 create mode 100644 package/python-pigpio/Config.in
 create mode 100644 package/python-pigpio/python-pigpio.mk

-- 
2.9.3
