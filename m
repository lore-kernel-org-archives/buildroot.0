From: ExDes <aloerchner@gmail.com>
Date: Fri, 15 Feb 2008 16:53:50 -0800 (PST)
Subject: [Buildroot]  Need help building toolchain for the kb9202 on linux
Message-ID: <15511998.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello,

I have been developing embedded software for many years, but am new to
working on an embedded linux platform, and have spent a great deal of time
trying to establish a working toolset.

My setup is such: I am running a standard pentium 4 machine loaded with
Ubuntu. For the IDE, I am using NetBeans with the C/C++ plugin. I purchased
the KB9202 some time ago and have wanted to write some applications for this
board as it comes out of the box (http://www.kwikbyte.com/KB9202.html) but
have not had any luck seting up a toolchain that will build the included
sample applications. This board uses the at91rm9200 ARM9 processor. A number
of paths that I have followed but had run into problems with in one form or
another:

1. I attempted to install Buildroot as per the directions given. since it
was some time ago, I do not recall what the show-stopper was. Sorry that I
cannot be more specific.

2. I attempted to build the toolset by running the script provided by
Charles M. "Chip" Coldwell, (http://www.schnozzle.org/~coldwell/toolchain/)
but ran into one dead stop due to an error after another. Another issue is
the patch 26_at91_serial.c.gz. This is called by the script but does not
seem to exist anymore.

What I am asking, is there anyone who, unlike myself, knows what they are
doing and has successfully built a toolchain for building code for the
Kwikbyte kb9202, and actually been able to build code that will run on the
system out of the box. If so, would someone be willing to guide me through
this process?

Thanks in advance,
-ExDes-
-- 
View this message in context: http://www.nabble.com/Need-help-building-toolchain-for-the-kb9202-on-linux-tp15511998p15511998.html
Sent from the BuildRoot mailing list archive at Nabble.com.
