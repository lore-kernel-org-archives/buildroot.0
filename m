From: Bob Smith <bsmith@linuxtoys.org>
Date: Tue, 26 Feb 2013 11:24:46 -0800
Subject: [Buildroot] HOWTO build a completely static php?
In-Reply-To: <20130226200724.44b6692f@skate>
References: <512CF95D.3050202@linuxtoys.org> <20130226200724.44b6692f@skate>
Message-ID: <512D0BFE.6000306@linuxtoys.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> On Tue, 26 Feb 2013 10:05:17 -0800, Bob Smith wrote:
>> I would like to build a completely static executable for
>> php.  What is the easiest way to do this?

> You don't have to build things statically to make things work in
> Android. You can just add uClibc or glibc to Android, next to Bionic.

D'oh!  Right, thanks.  I think this is what Karim called
a "meld" system.

http://www.opersys.com/downloads/cc-slides/embedded-android/embedded-android-120619.odp

thanks!
Bob Smith
