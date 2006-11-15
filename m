From: MikeW <mw_phil@yahoo.co.uk>
Date: Wed, 15 Nov 2006 15:50:52 +0000 (UTC)
Subject: [Buildroot] C++ cross compiler
References: <22099.82.171.61.116.1163581168.squirrel@webmail.aerende.com>
	<loom.20061115T152329-249@post.gmane.org>
	<24139.82.171.61.116.1163604033.squirrel@webmail.aerende.com>
Message-ID: <loom.20061115T164509-569@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 <nina.holly@...> writes:

> 
> Hi Mike,
>    The build completes without an error, just no
> arm-linux-g++ compiler gets built.  So I'm not sure
> if the patch would fix the problem.
> 
> Nina
>
Must be something more fundamental wrong - you'll have to try (e.g.)
capturing the build output and then checking through it with an editor
to try to find why it skips c++/g++ creation.

Had a problem with libstdc++ which I fixed as described.

I have had success using buildroot-20061031, with
binutils-2-16.91.0.7 and gcc-3.4.3

I also moved the download directory away from the default, so that
I could do dirclean without losing all the tar.gz files.

MikeW
