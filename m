From: Allan Clark <allanc@chickenandporn.com>
Date: Sat, 7 Jul 2007 14:10:04 -0400
Subject: [Buildroot] cp -dpR fails on BSD systems -- advice on resolving?
Message-ID: <37c712e0707071110x127595c1nb77f020c16a98a40@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone;

I ran into a problem when I moved from uclibc-snapshot to
uclibc-0.9.28 or 0.9.29: the "cp" command is a non-Unix option: "cp
-a" or "cp -dpR", or "cp --no-dereference"

I assume it's on Linux, and works, so those of us doing something
funky (like BSD or MacOSX) invite a few problems.

I'm wondering if the fix should be:
1) submit compatible patches to the group, using an older
syntax/options for all hosts, or
2) detect, and download/build/use a replacement (same way I did for
gmake, as was done for sed)

Allan

-- 
allanc at chickenandporn.com  "??" http://linkedin.com/in/goldfish
