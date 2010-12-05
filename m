From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Dec 2010 21:24:09 +0100
Subject: [Buildroot] [PATCH] util-linux: bump version to util-linux-ng
 2.18
In-Reply-To: <4CFBF373.5060905@googlemail.com>
References: <c26a121c90a5cc9c26c391be4e9568913df61769.1291561083.git.smiley73@users.sourceforge.net>
	<4CFBF373.5060905@googlemail.com>
Message-ID: <20101205212409.114c5be8@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 05 Dec 2010 21:17:55 +0100
Marcus Osdoba <marcus.osdoba@googlemail.com> wrote:

> I did similar work for version 2.17.2 some time ago. You can find my 
> work in bugzilla:
> https://bugs.uclibc.org/show_bug.cgi?id=2677
> 
> Your version does not seem to use the autotargets infrastructure.
> Mine does. Maybe you can use my version from bugzilla, update it to
> 2.18 and present the developers a new patch.
> 
> Just a hint to prevent double work.

Yes, I was going to tell Heiko about your previous work. I remember
that one thing made it a bit complicated to review: the relationship
with libuuid. I'll try to have a look at the patches again and see if I
can get them merged.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
