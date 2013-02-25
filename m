From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Feb 2013 15:16:37 +0100
Subject: [Buildroot] force buildroot to regenerate the output/target
 directory tree
In-Reply-To: <loom.20130225T144049-821@post.gmane.org>
References: <loom.20130225T144049-821@post.gmane.org>
Message-ID: <20130225151637.078e3155@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francesco Montorsi,

On Mon, 25 Feb 2013 13:46:00 +0000 (UTC), Francesco Montorsi wrote:

> I've been using buildroot since some time and there is a thing I
> didn't figure out yet. Consider this situation: I have a working
> buildroot environment; I have copied into the output/target folder
> some stuff so that when I run "make" buildroot generates for me
> images into output/images which already contain the contents I
> manually copied. Now I would like to "reset" the output/target
> folder, i.e. obtain the buildroot "vanilla" output/target tree and to
> obtian the buildroot vanilla output/images.... how can I do that
> without doing a "make clean" (which requires re-compilation of all
> packages and takes a lot of time)? 
> 
> does a "rm -rf output/target && make" works? 

No, it doesn't work, and as of today, there isn't really a simple and
reliable way of doing that.

How long is your entire build? What is your configuration (post
your .config if possible)? Do you have an external toolchain? Have you
used ccache? Are you perhaps building inside a virtual machine and/or
on a slow laptop?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
