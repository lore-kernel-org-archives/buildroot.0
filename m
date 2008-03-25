From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 26 Mar 2008 00:09:28 +0100
Subject: [Buildroot] pthread broken in avr32 build
References: <47E38167.7010908@apss.it>
Message-ID: <035301c88ece$f689eae0$040514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[snip]
It seems that libpthread has some problems because every program using 
threads ends with a segmentation fault. I first discovered this bug 
while testing JamVM & GNU Classpath. All worked fine, but simple 
applications using Java threads behaved in unexpected manner, while they 
worked fine on my Ubuntu box
[snip]

A friend of mine claims you have to use glibc to have threads properly working.


Best Regards
Ulf Samuelsson
