From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Thu, 24 Feb 2011 16:57:39 +0100
Subject: [Buildroot] Unable to login to buildroot
In-Reply-To: <818976D2341E8345BAE1673D4C4C4D88017C0D5E@mlbe2k10.cs.myharris.net>
References: <201102241048.48537.dargaud@lpsc.in2p3.fr>
	<201102241516.22825.dargaud@lpsc.in2p3.fr>
	<818976D2341E8345BAE1673D4C4C4D88017C0D5E@mlbe2k10.cs.myharris.net>
Message-ID: <201102241657.39597.dargaud@lpsc.in2p3.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> In the end, it turned out to be a floating-point support configuration
> mismatch between buildroot and my old kernel (2.6.24). After changing
> everything to a soft FPU on the old kernel and the buildroot toolchain,
> it all worked.

Hmmm, that ties up nicely with the end quesion of my 1st msg... I had an app 
throw a soft/hard float error on link. I was carefull to get fresh 
kernel+buildroot together with minimal changes but there must be something 
screwy.

I reverted to my old config and will give up oprofile for now...
-- 
Guillaume Dargaud
http://www.gdargaud.net/
