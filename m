From: JNY <jny0@hotmail.com>
Date: Thu, 2 Sep 2010 04:29:07 -0700 (PDT)
Subject: [Buildroot]  hwclock again
Message-ID: <29603222.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

I've enabled 
CONFIG_RTC=y
CONFIG_GEN_RTC=y
in linux-2.6.32.9.config and set the environment variable to read this file. 
After building and installing, I still get '/dev/misc/rtc': No such file or
directory when I use hwclock.

Why won't the hwclock work?
-- 
View this message in context: http://old.nabble.com/hwclock-again-tp29603222p29603222.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
