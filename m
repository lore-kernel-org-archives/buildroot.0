From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Date: Mon, 24 Jul 2017 08:07:36 -0300 (BRT)
Subject: [Buildroot] TestIso9660GrubExternal and
	TestIso9660GrubInternal	failing
In-Reply-To: <20170724091321.3bc29dcc@windsurf>
References: <20170723092643.GE2917@scaer>
 <5974e7554c7c_30a1600b705951e@ultri3.mail> <20170724091321.3bc29dcc@windsurf>
Message-ID: <1811138435.1205713.1500894456449.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

----- Original Message -----
> From: "Thomas Petazzoni"
> Sent: Monday, July 24, 2017 4:13:21 AM

> On Sun, 23 Jul 2017 15:13:41 -0300, Ricardo Martincoski wrote:
> 
>> My local computer has:
>> binutils 2.26.1
>> qemu 2.5.0
>> 
>> Using my local computer the tests TestIso9660GrubExternal and
>> TestIso9660GrubInternal always pass, in current master and also with the 3 grub
>> patches applied.
>> 
>> Using the image buildroot/base I can reproduce the problems:
>> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/23825707
>> GRUB requires a working absolute objcopy; upgrade your binutils
>> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/23831270
>> ==> System does not boot
> 
> And my patches did not fix this problem ?

Your patches fix the build problem with newer binutils.

But the runtime problem remains, according to Yann's analysis related to
binutils-2.28 installed in the host machine.
The second url above (ending in 270) are the tests running with your 3 patches
applied.

Regards,
--
Ricardo Martincoski
DATACOM 
Ethernet Switches 
Rua Am?rica, 1000 - Eldorado do Sul, RS - 92990-000 - Brasil
+55 51 3933 3000 - Ramal 3307
ricardo.martincoski at datacom.ind.br
www.datacom.ind.br
