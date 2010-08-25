From: JNY <jny0@hotmail.com>
Date: Wed, 25 Aug 2010 00:41:39 -0700 (PDT)
Subject: [Buildroot] hwclock doesn't work
In-Reply-To: <29519433.post@talk.nabble.com>
References: <29519433.post@talk.nabble.com>
Message-ID: <29529545.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


When  I use dmesg|grep -i rtc, I get the response:
platform rtc-cmos: registered platform RTC device (no PNP device found)

When I use dmesg|grep -i clock, I get the response:
Switching to clocksource pit

If this is dealt with by the kernel, do I have to look through the linux26
menuconfig instead?
-- 
View this message in context: http://old.nabble.com/hwclock-doesn%27t-work-tp29519433p29529545.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
