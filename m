From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 23 Apr 2013 23:42:05 +0200
Subject: [Buildroot] [PATCH] busybox: rename patches as per the new
	standard and update 1.21.0 mdev
In-Reply-To: <5176F8B6.8020204@mind.be> (Arnout Vandecappelle's message of
 "Tue, 23 Apr 2013 23:10:14 +0200")
References: <1366723305-14386-1-git-send-email-gustavo@zacarias.com.ar>
 <8761zde433.fsf@dell.be.48ers.dk> <5176F8B6.8020204@mind.be>
Message-ID: <87bo94divm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On 23/04/13 16:04, Peter Korsgaard wrote:
 >>>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:
 >> 
 Gustavo> Rename patches as per the patch naming policy and update the
 Gustavo> mdev fix patch for 1.21.0 which reinstates subsystem matching
 Gustavo> functionality.
 >> 
 >> Sorry, I disagree with this rename. I know this is what we discussed at
 >> the dev day, but it imho makes more sense to use the upstream naming
 >> convention for busybox:
 >> 
 >> http://busybox.net/downloads/fixes-1.21.0/

 Arnout>  Actually, if upstream has the patches available for download,
 Arnout> they should be downloaded instead of of included in buildroot,
 Arnout> no?

True. For busybox our patch download infrastructure unfortunately
doesn't work as the patches aren't located in the same directory as the
tarball (and the fact that we support multiple versions also makes it a
bit more complicated).

-- 
Bye, Peter Korsgaard
