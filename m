From: Ulf Samuelsson <ulf@atmel.com>
Date: Sun, 29 Jul 2007 19:09:43 +0200
Subject: [Buildroot] [patch] slang.mk (was: something (slang?) creates
	buildroot/build_i486/staging_dir/include)
References: <0707290103020.8510@somehost> <0707290121380.8510@somehost>
	<0707291107480.8510@somehost>
Message-ID: <00f501c7d26c$00029a60$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> I do not know much about the buildroot backyard, but I read some
> discussions about the include-dir being $(STAGING_DIR)/usr/include/
> and not $(STAGING_DIR)/include/. Wouldn't it be a good idea to make that a
> variable somewhere in the top makefiles, something like:
> 
>  STAGING_INCLUDE_DIR = $(STAGING_DIR)/usr/include/
> 
Some stuff is normally installed in $(STAGING_DIR)/usr/include/ and 
others in $(STAGING_DIR)/include/, so I do not think it will work

> and change all .mk files to use that instead? That should give one point
> of control on where the header files are installed and avoid errors and
> confusion.
> 


Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57

Technical support when I am not available:
AT90 AVR Applications Group: mailto:avr at atmel.com
AT91 ARM Applications Group: mailto:at91support at atmel.com
AVR32 Applications Group        mailto:avr32 at atmel.com
http://www.avrfreaks.net/;            http://avr32linux.org/
http://www.at91.com/ ;                ftp://at91dist:distrib at 81.80.104.162/
