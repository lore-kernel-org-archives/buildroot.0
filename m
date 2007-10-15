From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 15 Oct 2007 23:25:52 +0200
Subject: [Buildroot] AVR32 4.1.2 toolchain build issues [was svn
	commit:trunk/buildroot: target/device target/device/Atmel
	target etc...]
References: <d6cda7730710140720r55bd9903s5001f0b864fe9952@mail.gmail.com>
Message-ID: <02c301c80f72$254d2400$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>   That commit introduced gcc 4.2.1 to avr32, which builds ok, but the
> compiler still has some bugs, specially the C++ compiler and the
> template engine.


I tested with

make atngw100_defconfig
make

which manages to build both the linux and the root fs.

atstk1002_defconfig has not been tested yet.


Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57 
