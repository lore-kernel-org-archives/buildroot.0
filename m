From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 24 Jul 2008 16:37:14 +0200
Subject: [Buildroot] [PATCH 5/5] lxdoom: make package depend on
	X11	server
In-Reply-To: <1216905820.29392.15.camel@localhost>
References: <1216905717-9197-1-git-send-email-hans-christian.egtvedt@atmel.com>
	<1216905717-9197-2-git-send-email-hans-christian.egtvedt@atmel.com>
	<1216905717-9197-3-git-send-email-hans-christian.egtvedt@atmel.com>
	<1216905717-9197-4-git-send-email-hans-christian.egtvedt@atmel.com>
	<1216905717-9197-5-git-send-email-hans-christian.egtvedt@atmel.com>
	<1216905820.29392.15.camel@localhost>
Message-ID: <20080724143714.GD4991@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 24, 2008 at 03:23:40PM +0200, Hans-Christian Egtvedt wrote:
>On Thu, 2008-07-24 at 15:21 +0200, Hans-Christian Egtvedt wrote:
>> lxdoom depends on a X11 server to be built, this patch will only show lxdoom if
>> a X11 server is selected and add xserver_xorg-server to the dependency list.
>> 
>
>For the record, I have no idea how the X11 server stuff is working, so I
>added the code on an assumption of how it works.

my doom doesn't need an xserver. YMMV :P
