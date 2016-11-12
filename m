From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Nov 2016 22:13:27 +0100
Subject: [Buildroot] Enable option of nodeJS 4.1.2 in buildroot 2015.11
In-Reply-To: <CALD51P8hSabOW+SdV0Ycc46Ar4Pqn0jZuyazKhUUQcqKvsg6qA@mail.gmail.com>
References: <CALD51P8hSabOW+SdV0Ycc46Ar4Pqn0jZuyazKhUUQcqKvsg6qA@mail.gmail.com>
Message-ID: <20161112211327.GC3700@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lijun, All,

On 2016-11-10 19:28 -0600, Lijun QIN spake thusly:
> Hello Buildroot supporter,
> 
> I have Buildroot 2015.11 with some Marvell flavor.

Please update your Buidlroot version.

> According to Mavell's instructions, I did

Sorry, this is the support for the official Buildroot. If you have
troubles with a fork from some vendors, we can't really help: we have no
way to know what has been changed in your tree.

> (1) make mvebu_armv7_le_defconfig
> (2) select external toolchain gcc5.2-HF
> (3) I run make menuconfig, trying to select Node.JS 4.1.2 package in
> Interpreter languages and scripting selection, but only node.JS 0.10.40 is
> available.
> (4)  However,  I tried to make raspberrypi2_defconfig,  make menuconfig
> does offer options to
>       select Node.JS 4.1.2.
>  Could you please possibly provide any advice on fix ? I post some part of
> my .config file

Please use the latest released version of Buildroot, and you'll even get
nodejs 6.7.0 for the rpi2.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
