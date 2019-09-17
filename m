From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Sep 2019 22:14:11 +0200
Subject: [Buildroot] [PATCH] package/asterisk: security bump to version
 16.5.1
In-Reply-To: <20190906154656.10935-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 6 Sep 2019 17:46:55 +0200")
References: <20190906154656.10935-1-peter@korsgaard.com>
Message-ID: <87lfum3cks.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > AST-2019-004: Crash when negotiating for T.38 with a declined stream
 > When Asterisk sends a re-invite initiating T.38 faxing, and the endpoint
 > responds with a declined media stream a crash will then occur in Asterisk.
 > https://downloads.asterisk.org/pub/security/AST-2019-004.pdf

 > AST-2019-005: Remote Crash Vulnerability in audio transcoding
 > When audio frames are given to the audio transcoding support in Asterisk the
 > number of samples are examined and as part of this a message is output to
 > indicate that no samples are present. A change was done to suppress this
 > message for a particular scenario in which the message was not relevant. This
 > change assumed that information about the origin of a frame will always exist
 > when in reality it may not.
 > https://downloads.asterisk.org/pub/security/AST-2019-005.pdf

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
