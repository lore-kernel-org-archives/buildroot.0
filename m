From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Nov 2011 23:04:29 +0100
Subject: [Buildroot] equivalent of a 'make modules'
In-Reply-To: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
Message-ID: <20111122230429.2bef52c2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 22 Nov 2011 14:51:53 -0600,
"Jeff Krasky" <jeff.krasky@dspcg.com> a ?crit :

> I am working with another program that builds itself against the
> kernel.  I am using BuildRoot for making the kernel and filesystem.
> It is believed that the next step would be to do something like a
> "make modules" command so that the kernel and filesystem can be
> rebuilt with this other program's information in it.

Can you expand on what this program is ?

With your information, it's a bit hard to understand what you're trying
to achieve, and therefore to give you possible solutions.

> In Buildroot, where I normally do the 'make' command, I tried 'make
> modules' and got this message:

'modules' is a target of the Linux build system. Buildroot has
different targets, because Buildroot does a different job than the
Linux build system.

We really need more information about what your program is, how it
relates to the kernel build process, etc.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
