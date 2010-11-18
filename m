From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Nov 2010 08:31:44 +0100
Subject: [Buildroot] arm-linux-ld: BFD 2.17 assertion fail with
 arm-linux-gcc 4.1.1
In-Reply-To: <964203.74563.qm@web114602.mail.gq1.yahoo.com>
References: <964203.74563.qm@web114602.mail.gq1.yahoo.com>
Message-ID: <20101118083144.3056445d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Nov 2010 21:46:49 -0800 (PST)
Tamamontu M <tamamontu@yahoo.com.au> wrote:

> I am trying to compile my source code which uses std librarie
> functions. I have added following option to LDFLAGS in the make file.
> 
>  -L/usr/local/arm/4.1.1-920t/lib
> -L/usr/local/arm/4.1.1-920t/lib/gcc/arm-linux-uclibc/4.1.1 -lgcc -lc 

Where does your toolchain comes from ? It would probably be a good idea
to upgrade to at least gcc 4.3.x and a more recent version of binutils.

And again, how is this related to Buildroot ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
