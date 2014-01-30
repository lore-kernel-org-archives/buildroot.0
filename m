From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Thu, 30 Jan 2014 18:19:07 +0100
Subject: [Buildroot] udev and serial port
In-Reply-To: <52EA5EA7.3010305@gmail.com>
References: <52E4FA8C.7060109@gmail.com>	<52E6945C.40202@mind.be>	<52E8120F.7080805@gmail.com>	<20140128230904.1f01a5dc@skate>	<52E8AA41.1020709@mind.be>
 <20140129093013.5ca63190@skate> <52E8DB08.8060107@mind.be>
 <52EA5785.5050507@gmail.com> <52EA58D8.8070103@zacarias.com.ar>
 <52EA5EA7.3010305@gmail.com>
Message-ID: <52EA898B.1050103@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 30/01/2014 15:16, Marco Trapanese ha scritto:
> # CONFIG_USB_SERIAL is not set
>
> which I think I should turn on.
> I can add by myself CONFIG_USB_SERIAL_FTDI_SIO=y?


Don't worry, I found the entries using make linux-menuconfig (I had to 
disable again the ccache to show the menu).

Now it's compiling...
Thanks
Marco
