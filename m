From: JNY <jny0@hotmail.com>
Date: Thu, 22 Jul 2010 08:55:32 -0700 (PDT)
Subject: [Buildroot]  GetTime() no longer works after toolchain rebuild
Message-ID: <29238584.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,
I've recently rebuilt a toolchain, and now when I recompile some old (c)
code, the GetTime() isn't recognised.  The code compiles, and runs (mostly)
on the target architecture.  The GetTime() function isn't one I recognise
(as I inherited the code), and believe I must have missed something when
rebuilding the toolchain.  Any ideas what library this belongs to, and what
I have to do to get it working again.

The function isn't doing much, but, after commenting it out, other things in
the code no longer work, and I believe some (maybe all) of them will start
working once I get this one sorted.  Either way, this'll be a step in the
right direction.
Regards
-- 
View this message in context: http://old.nabble.com/GetTime%28%29-no-longer-works-after-toolchain-rebuild-tp29238584p29238584.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
