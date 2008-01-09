From: Joe <zentrale.at.work@gmail.com>
Date: Wed, 09 Jan 2008 18:02:09 +0100
Subject: [Buildroot] How is the RM9200 status of buildroot ?
In-Reply-To: <002601c852d6$7d1d72a0$6e00a8c0@JONATHAN>
References: <05f701c85243$52e4c530$6e00a8c0@JONATHAN>	<01ce01c8524a$65be7fa0$080514ac@atmel.com>
	<002601c852d6$7d1d72a0$6e00a8c0@JONATHAN>
Message-ID: <4784FE11.5090702@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I would like to know if it is possible to do some basinc testing on my board
> to know if my memories setup is working correctly before going to far with
> linux etc. ? I have acces to a jtag interface if this can help. 

Sure. First thing ist to get your U-Boot working and fitted to your 
System, for it does the whole hardware init concerning low level 
memories. If it's working fine, you should give the mems some test, 
especially boundaries of the SDs are of interest. Booting on its own and 
  having a fuly functional u-boot should the give you a good start for 
linux.

Greetz Joe

-- 
Sepp "ZaP" Holzmayr

please reply to:
zentrale.at.work at gmail.com

watch out for:
www.rocksociety.de
