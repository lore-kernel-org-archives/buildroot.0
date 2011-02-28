From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Mon, 28 Feb 2011 22:31:35 +0100
Subject: [Buildroot] [git commit master 1/1] webif: mark as deprecated
In-Reply-To: <20110227212630.8BB2F8F77C@busybox.osuosl.org>
References: <20110227212630.8BB2F8F77C@busybox.osuosl.org>
Message-ID: <4D6C1437.7060901@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 27.02.2011 22:25, schrieb Peter Korsgaard:
>
> It's long dead upstream and hasn't seen any updates since it got added
> back in 2008.
>
The project is currently located here:
http://code.google.com/p/x-wrt/source/browse/

It does not use a top level Makefile anymore and is designed to be a 
feed in OpenWrt. This makes it more difficult to port it over to a 
generic "distribution" like buildroot. Furthermore it relies on UCI now.

The webif currently included in br (whiterussian?) was well welcome, 
when I experimented with a headless device. The webinterface was small 
and used busybox httpd capabilities. The basic information provided by 
some of the applets were useful for basic debugging ... but not more.
