From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 22:40:22 +0200
Subject: [Buildroot] [PATCH 1/6] uclibc: bump uClibc-ng to 1.0.3
In-Reply-To: <20150614190348.GP21686@waldemar-brodkorb.de>
References: <1434292411-5003-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1434292411-5003-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150614190348.GP21686@waldemar-brodkorb.de>
Message-ID: <20150614224022.16c6019d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar,

On Sun, 14 Jun 2015 21:03:48 +0200, Waldemar Brodkorb wrote:

> > This commit bumps uClibc-ng to the latest version, and drops the two
> > patches that have been merged upstream.
> 
> Have you seen the new uclibcng-testrunner.sh? It can be used on a
> target without GNU make. I tested it already with busybox hush.
> This might be used on no-MMU targets.

Yes, I've seen it, but so far I haven't used it. We could add support
for it later on.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
