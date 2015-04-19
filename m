From: Robert P. J. Day <rpjday@crashcourse.ca>
Date: Sun, 19 Apr 2015 12:32:04 -0400 (EDT)
Subject: [Buildroot] auto.conf versus autoconf.h versus .config
Message-ID: <alpine.LFD.2.11.1504191223050.3495@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


  just want to clarify the generated config artifacts and their
ordering if i may ... i'm looking at the output objects under
output/build/buildroot-config, especially these:

* auto.conf
* autoconf.h

and if memory serves, auto.conf represents the *set* config variables
that result from my configuration (which, for my BBB, is 187 lines
long), while the top-level .config file represents exactly the same
information, but padded out with many hundreds of lines of "is not
set" lines, hence its much longer length of well over 2500 lines for
me. do i understand that correctly?

  finally, there's autoconf.h, which is just the transformed version
of auto.conf suitable for inclusion in source and header files.

  do i have that about right? there are also the numerous header files
and subdirs under .../br2 in that location, but in my case, every
single *.h file in that br2/ directory is empty. what is the purpose
of all those empty header files? just placeholders of some kind?
(there are lots of subdirs there as well, but i'm just curious about
the empty header files *immediately* under br2/ there.)

rday

p.s. if all this is explained somewhere, pointing me at it will be
just ducky.

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
