From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 07 May 2009 14:23:58 +0200
Subject: [Buildroot] Getting problem when make menuconfig
In-Reply-To: <23407612.post@talk.nabble.com> (sudheer bangera's message of
	"Thu\, 7 May 2009 04\:52\:25 -0700 \(PDT\)")
References: <23407612.post@talk.nabble.com>
Message-ID: <87skjhcd9d.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "sudheer" == sudheer bangera <bsudheer143@indiatimes.com> writes:

Hi,

 sudheer> /usr/bin/gcc  -DCURSES_LOC = '<ncurses.h>" -DLOCALE  -g  -02 -MM *.c >
 sudheer> .depend 2>/dec/null || ;
 sudheer> make[1]: Entering directory ' /home/sudheer/buildroot/package/config'
 sudheer> make[1]: warning : File ' Makefile.kconfig' has modification time 2.8e+06s
 sudheer> in the future
 sudheer> /usr/bin/gcc  -DCURSES_LOC = '<ncurses.h>" -DLOCALE  -g  -02 -MM *.c >
 sudheer> .depend 2>/dec/null || ;

 sudheer> It is contineously  repeating untill we stop (Cntr C) 
 sudheer> please help me to solve this problem.
 sudheer> i am using following software and hardware config:

Seems like your clock is very much off. Please set it and try again.

-- 
Bye, Peter Korsgaard
