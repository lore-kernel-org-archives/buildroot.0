From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Dec 2011 15:56:50 +0100
Subject: [Buildroot] crosstool-ng and uClibc toolchain
In-Reply-To: <4ED8E43B.6020102@carallon.com>
References: <4ED8E43B.6020102@carallon.com>
Message-ID: <20111202155650.590ef8fd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 02 Dec 2011 14:44:11 +0000,
Will Wagner <will_wagner@carallon.com> a ?crit :

> In fact the uClibc config you are forced to use has lots of settings I 
> would consider wrong.
> 
> Am I correct thinking these things are broken or am I missing something?

I haven't fallen into these issues as I'm not using the ct-ng backend
a lot (I do use ct-ng outside of Buildroot in general).

> Am currently working on a patch that does the following:
> - Allow user to pick uClibc version when using ct-ng
> - Allow user to select nptl when using 0.9.32
> - Supply better default uClibc config files (Using same config files as 
> for internal buildroot config)
> - Allow user to specify a custom uClibc config file

Those sounds like good ideas, especially the sharing the uClibc config
files between the internal build process and the ct-ng build process.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
