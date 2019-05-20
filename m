From: muhammet <mk61@hotmail.com>
Date: Mon, 20 May 2019 00:10:18 -0500 (CDT)
Subject: [Buildroot] Orange pi zero:  i2c is not under /dev
In-Reply-To: <8736lez2xe.fsf@dell.be.48ers.dk>
References: <1557981319043-0.post@n4.nabble.com>
 <20190516080159.6d844d12@windsurf> <1557988831153-0.post@n4.nabble.com>
 <20190516085647.7a861d60@windsurf> <1558005190987-0.post@n4.nabble.com>
 <8736lez2xe.fsf@dell.be.48ers.dk>
Message-ID: <1558329018693-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

Actually orange pi zero has i2c. I managed to see i2c under /dev and able to
use it.

I decompile dtb file under buildroot/output/images to dts file. All three
I2C status were "disabled" there. I changed them to "okay". Then compile dts
file  to dtb file. Then load to sd card and it worked.

I wonder why all i2c status are "disabled". And is there an easy way to
change them(maybe in menuconfig menu)



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
