From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jun 2010 17:37:22 +0200
Subject: [Buildroot] Valgrind compilation, with patch 3.5.0, need help
In-Reply-To: <4C164671.2050903@terawatt.fr>
References: <4C164671.2050903@terawatt.fr>
Message-ID: <20100614173722.4358b2d7@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Jun 2010 17:10:41 +0200
Damien Borie <dbe@terawatt.fr> wrote:

> I Have to add Valgrind to my distribution to debug my programs. The 
> version in buildroot doesn't compile because it needs glibc 2.2 -2.5, 
> and I have 2.9. So I tried with the patch to bump to Valgrind 3.5.0.
> But it ask me fro a file to patch, and I don't understand what I must
> type to apply correctly the patch and compile Valgrind. In the match
> itself, I cannot see indications about this file to choose.

What is your target architecture ? Remember that Valgrind only works on
x86, x86_64 and PowerPC 32/64.

Moreover, I don't really see how Valgrind in Buildroot would depend on
a particular version of glibc. Can you be more specific about what
you're doing and the exact result of the commands you're using ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
