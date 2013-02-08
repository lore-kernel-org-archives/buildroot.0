From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 08 Feb 2013 22:18:18 +0100
Subject: [Buildroot] [PATCH] rootfs-overlay: also exclude .empty files
In-Reply-To: <1360274290-16081-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Thu, 7 Feb 2013 22:58:10 +0100")
References: <CAJkQPO=A+_7t-dbSP8VutAsen+MvG9J44qx3D6uxKt7C2mBQUg@mail.gmail.com>
 <1360274290-16081-1-git-send-email-arnout@mind.be>
Message-ID: <87zjzefqsl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> This makes it possible to put empty directories in the overlay.
 Arnout> Thanks to Aras Vaichas for pointing that out.

Committed, thanks.

-- 
Bye, Peter Korsgaard
