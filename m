From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 21:40:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/go: bump version to 1.6.2
In-Reply-To: <20160507184514.GA2419@tarshish>
References: <1462551812-8952-1-git-send-email-christian@paral.in>
 <20160507144313.4e7112af@free-electrons.com>
 <20160507184514.GA2419@tarshish>
Message-ID: <20160507214016.5592aea2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 7 May 2016 21:45:14 +0300, Baruch Siach wrote:

> Seems to be fixed in 1.5.2. See 
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=807136.

As far as I understand, we can't use go 1.5.2 as the bootstrap
compiler, because since 1.5.x, Go is written in Go. I guess we will
have to backport the patch.

Christian, Geoff, do you know if the Go community intends to maintain
Go 1.4.x for the foreseeable future, so that we can still officially
rely on it as a bootstrap Go compiler?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
