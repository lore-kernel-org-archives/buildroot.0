From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Aug 2010 09:33:38 +0200
Subject: [Buildroot] [PATCH 10/20] libglib2: add patch to rework
 clock_gettime() test
In-Reply-To: <8739u5khpg.fsf@macbook.be.48ers.dk>
References: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
	<cover.1282471311.git.thomas.petazzoni@free-electrons.com>
	<7dfc97b926288b402f07f49c2464cf9fd48edbdd.1282471311.git.thomas.petazzoni@free-electrons.com>
	<8739u5khpg.fsf@macbook.be.48ers.dk>
Message-ID: <20100824093338.60d49ec5@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Aug 2010 07:42:51 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> Thanks! It would be good to have a summary of the above in the patch
> header itself.

Ok, done, and pushed at the same location.

> Have you sent this upstream?

As discussed on IRC, no, not yet. I am not sure the fix is 100%
correct, and I had no feedback about it on the autoconf mailing list. I
can still try to push it upstream to libglib2 anyway, but I'm not sure
how to explain why it's their package that is broken and not the other
one filling the configuration cache.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
