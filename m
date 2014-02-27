From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Feb 2014 15:40:41 +0100
Subject: [Buildroot] [PATCH] vlc: fix shared library building
In-Reply-To: <1393456876-8525-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Thu, 27 Feb 2014 00:21:16 +0100")
References: <1393456876-8525-1-git-send-email-arnout@mind.be>
Message-ID: <87wqgg8vpy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > Fixes e.g.
 > http://autobuild.buildroot.net/results/9c7/9c7a97882d446a42cabcb07e4af7e6825192e70b

 > VLC cannot build static and shared libraries at the same time.

 > Also, live555 only has a static library, and VLC tries to link this into
 > a shared library. Therefore, disable the live555 plugin unless static
 > linking is selected. It would be better to build live555 as a shared
 > library, but that's for another patch.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > ---
 > I obviously haven't tested this very intensively, but it makes at least
 > one build work :-)

Great ;)

Committed, thanks.

-- 
Bye, Peter Korsgaard
