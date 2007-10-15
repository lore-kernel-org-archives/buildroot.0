From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Mon, 15 Oct 2007 23:52:59 +0300
Subject: [Buildroot] Some devices are not created in the ext2 filesystem.
In-Reply-To: <406A31B117F2734987636D6CCC93EE3C02528F7F@ehost011-3.exch011.intermedia.net>
References: <20071012210141.1DF69A5E1B@busybox.net>	<0710131046500.9729@somehost>	<1192269439.26495.4.camel@elrond.atmel.sweden>	<0710131212520.9729@somehost>	<1192300638.26495.13.camel@elrond.atmel.sweden>	<0710132115250.9729@somehost>	<1192307460.26495.27.camel@elrond.atmel.sweden><0710132305350.9729@somehost>	<47116C13.9020701@promwad.com><406A31B117F2734987636D6CCC93EE3C02528F70@ehost011-3.exch011.intermedia.net><47120EE5.9040508@promwad.com><406A31B117F2734987636D6CCC93EE3C02528F79@ehost011-3.exch011.intermedia.net>
	<47128B0E.5040501@promwad.com>
	<406A31B117F2734987636D6CCC93EE3C02528F7F@ehost011-3.exch011.intermedia.net>
Message-ID: <4713D32B.3030502@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Leonid wrote:
> Hi, Ivan:
> 
> As I see also on other systems, /dev/null is normally created with 660
> permission like many other devices (/dev/console for example). I thought
> that buildroot runs udev with correct user to be able to rewrite all
> devices in /dev without trouble. 
> 
> So, I suppose, my question is this: is it some intrinsic buildroot
> udev-related bug or something wrong in my own system which results in
> such error? What would you recommend to do?
> 

I'd suggest just turn udev off.


Best regards,
Ivan
