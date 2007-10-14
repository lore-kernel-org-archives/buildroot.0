From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sun, 14 Oct 2007 19:59:06 +0300
Subject: [Buildroot] Some devices are not created in the ext2 filesystem.
In-Reply-To: <002c01c80e5e$f177bcd0$6614a8c0@softalap>
References: <20071012210141.1DF69A5E1B@busybox.net>	<0710131046500.9729@somehost>	<1192269439.26495.4.camel@elrond.atmel.sweden>	<0710131212520.9729@somehost>	<1192300638.26495.13.camel@elrond.atmel.sweden>	<0710132115250.9729@somehost>	<1192307460.26495.27.camel@elrond.atmel.sweden><0710132305350.9729@somehost>	<47116C13.9020701@promwad.com><406A31B117F2734987636D6CCC93EE3C02528F70@ehost011-3.exch011.intermedia.net>
	<47120EE5.9040508@promwad.com>
	<002c01c80e5e$f177bcd0$6614a8c0@softalap>
Message-ID: <47124ADA.20000@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> Listed files are regular files, not device nodes! Use devicetable.txt for 
> creating device nodes.
> 
> BR
> Assen
> 

Assen, but Leonid did use device_table.txt , see his previous post:

>I need some device nodes for my proprietary driver and I have added
>appropriate lines to the end of
>target/device/Atmel/root/device_table.txt table I'm using:


BR,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
