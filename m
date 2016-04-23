From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Apr 2016 14:16:17 +0200
Subject: [Buildroot] [PATCH 1/2] package/mono: bump to version 4.2.2.30
In-Reply-To: <20160423115621.GL26720@waldemar-brodkorb.de>
References: <1455487411-14605-1-git-send-email-angelo.compagnucci@gmail.com>
 <20160421224114.5740b8a7@free-electrons.com>
 <20160423115621.GL26720@waldemar-brodkorb.de>
Message-ID: <20160423141617.42fa15d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Apr 2016 13:56:21 +0200, Waldemar Brodkorb wrote:

> I think we must disable it for sparc32 (v8/leon).
> See line 2849 in configure.ac, they force cpu=v9, because
> they don't support others.

OK. Will you send a patch doing this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
