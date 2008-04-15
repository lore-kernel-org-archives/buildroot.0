From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Tue, 15 Apr 2008 11:33:37 +0200
Subject: [Buildroot] zImage.embedded
References: <014701c89bda$09380060$ad289e86@LPSC0173W><fa686aa40804110655x48120e84tde01a52d8bb39a3@mail.gmail.com>
	<01e801c89e49$6d0e6400$ad289e86@LPSC0173W>
	<000b01c89eb5$2af81630$070514ac@atmel.com>
Message-ID: <02f201c89edb$cb666150$ad289e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I think you need to figure out how to build u-boot for your board
> outside buildroot, before you try to build it inside buildroot.

Working on it...

While I do that, I have a side question:
is it possible to boot off a first kernel on a local partition, but tell it 
to tftp boot off another kernel instead ?

The rational is that I have a working system on a card in my embedded 
system, but if possible I'd like to have it boot off the latest version 
available on the network.

And if not available, simple boot using fallback parameters.

Makes sense ?
-- 
Guillaume Dargaud
http://www.gdargaud.net/
