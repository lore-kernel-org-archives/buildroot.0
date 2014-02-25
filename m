From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 Feb 2014 22:46:02 +0100
Subject: [Buildroot] [PATCH] vlc: add warning that it has known issues
In-Reply-To: <1393363076-22276-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Tue, 25 Feb 2014 22:17:56 +0100")
References: <1393363076-22276-1-git-send-email-arnout@mind.be>
Message-ID: <878usyj279.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > We've seen autobuilder failures for vlc on many platforms and we don't
 > know how to solve them. It is also currently orphaned, i.e. there is
 > nobody who is actively using the package and maintaining it in
 > buildroot.

 > We could mark the package as BROKEN, but that would make it completely
 > invisible for the users and the autobuilders, which would not help its
 > orphan-ness. Therefore, instead, add a big fat warning in the config
 > menus that it has known issues.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
