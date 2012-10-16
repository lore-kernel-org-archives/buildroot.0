From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 16 Oct 2012 21:57:38 +0200
Subject: [Buildroot] [PATCH] strace: Version bump to 4.7
In-Reply-To: <87ipapxbp2.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
 of "Fri, 05 Oct 2012 15:58:33 +0200")
References: <1348821796-28798-1-git-send-email-markos.chandras@gmail.com>
 <87a9w20xrj.fsf@macbook.be.48ers.dk>
 <87boghzdjc.fsf@macbook.be.48ers.dk>
 <CAG2jQ8i1KwuFQKkpW=5=M=tx5QB0SPKowpxbejPVPUrnaSG5AQ@mail.gmail.com>
 <CAG2jQ8jMZ=PQEd=YJipP1cH=6-CyHD01YWsMYxZs67Rb5Wd2PQ@mail.gmail.com>
 <87ipapxbp2.fsf@macbook.be.48ers.dk>
Message-ID: <87ehkytcjx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@gmail.com> writes:
 Markos> Hi Peter,

 Markos> This also happens with the latest strace git code. It seems like
 Markos> -D_FILE_OFFSET_BITS=64 is causing it. But there are also some other
 Markos> problems in the LFS support. I will see if I can write some patches
 Markos> and send them upstream.

 Peter> Great, thanks!

Any progress on this? All the strace failures on the autobuilders are
not so nice. Alternatively I can revert until we have a fix.

-- 
Bye, Peter Korsgaard
