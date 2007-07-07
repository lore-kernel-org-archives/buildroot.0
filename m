From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 7 Jul 2007 20:42:49 +0200
Subject: [Buildroot] cp -dpR fails on BSD systems -- advice on resolving?
In-Reply-To: <468FDBF5.6060807@cs.helsinki.fi>
References: <37c712e0707071110x127595c1nb77f020c16a98a40@mail.gmail.com>
	<468FDBF5.6060807@cs.helsinki.fi>
Message-ID: <20070707184248.GX4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 07, 2007 at 09:31:17PM +0300, Heikki Lindholm wrote:
>Allan Clark kirjoitti:
>> Hi everyone;
>> 
>> I ran into a problem when I moved from uclibc-snapshot to
>> uclibc-0.9.28 or 0.9.29: the "cp" command is a non-Unix option: "cp
>> -a" or "cp -dpR", or "cp --no-dereference"
>> 
>> I assume it's on Linux, and works, so those of us doing something
>> funky (like BSD or MacOSX) invite a few problems.
>> 
>> I'm wondering if the fix should be:
>> 1) submit compatible patches to the group, using an older
>> syntax/options for all hosts, or
>> 2) detect, and download/build/use a replacement (same way I did for
>> gmake, as was done for sed)
>
>OT: Any particular reason you're using a Chinese charset? Anyway, issues
>of cp have been discussed before on this list. And there are bug reports
>about it in the tracker. I suppose nothing conclusive was ever reached.
>In the case of uClibc, one could imagine replacing the cp with the tar
>trick that's used in the SVN trunk, but the problem, as you surely know
>by now, has much wider manifestation over buildroot, and should be dealt
>with some uniform, generally agreed upon, way everywhere.

This is http://bugs.uclibc.org/view.php?id=944
Please followup there (would be nice if we could fix this once and for
all).
