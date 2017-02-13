From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Feb 2017 13:26:12 +0100
Subject: [Buildroot] bison-2.4.3 compiling issue
In-Reply-To: <CALD51P_KryQ2hGeqZqYj_vEt6d_Pmcn39aL=p9p6KrW534UGTw@mail.gmail.com>
References: <CALD51P_KryQ2hGeqZqYj_vEt6d_Pmcn39aL=p9p6KrW534UGTw@mail.gmail.com>
Message-ID: <20170213132612.7a8c8899@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Feb 2017 16:28:40 -0600, Lijun QIN wrote:

> But buildroot-2011.05 + 32-Bit Ubuntu Linux 16.04 works fails at
> host-bison-2.4.3
> Could someboy could offer any adivce ? Using single really helps me
> increase efficiency.

Bump the bison version to a newer one, or alternatively apply a fix
like
https://dev.openwrt.org/browser/branches/backfire/tools/bison/patches/100-fix-gets-removal.patch?rev=33081.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
