From: Barry Kauler <bkauler@gmail.com>
Date: Fri, 18 Mar 2011 18:40:17 +0800
Subject: [Buildroot] [buildroot] libdrm tries to compile before cairo
Message-ID: <AANLkTinJmH7Jsb25KJY6WN5YZaHHKqRJO0ctNA3NmKog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, I am a first-time user of Buildroot. It has been chugging along
nicely, but libdrm has failed to compile.

It reports that 'cairo.h' is missing. Which it is, cairo has not yet
been compiled in the target.

So, using my own reasoning, I added "cairo" onto LIBDRM_DEPENDENCIES
variable in file 'libdrm.mk'. I also deleted
output/build/libdrm-2.4.19.

However, running 'make' again, it tries to compile libdrm again, and fails.

How do I make it compile cairo (and its deps) before libdrm?

Regards,
Barry Kauler
