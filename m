From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 19 Jan 2013 11:34:45 +0100
Subject: [Buildroot] [PATCH 1/1] Qt : bump version to latest 4.8.4
In-Reply-To: <50FA67AD.3070506@relinux.de> (Stephan Hoffmann's message of
 "Sat, 19 Jan 2013 10:30:21 +0100")
References: <1358081260-14635-1-git-send-email-sagaert.johan@skynet.be>
 <871udozzd5.fsf@dell.be.48ers.dk> <50FA67AD.3070506@relinux.de>
Message-ID: <87622th35m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stephan" == Stephan Hoffmann <sho@relinux.de> writes:

 Stephan> Am 13.01.2013 19:55, schrieb Peter Korsgaard:
 >>>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:
 Sagaert> Qt : bump verson to latest release of QT 4
 Sagaert> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
 >> 
 >> Committed, thanks (with a tweaked commit message)
 >> 
 Stephan> Hello,

 Stephan> this one seems to break autobuild on arm:

Yes, the webkit part seems to have grown a gstreamer dependency. I'll
take a look at it, but this weekend is my Sons birthday - So it probably
won't be before next week.

-- 
Bye, Peter Korsgaard
