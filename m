From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Nov 2012 23:32:45 +0100
Subject: [Buildroot] [PATCH 1/1] qextserialport : fix download and bump
	version
In-Reply-To: <1352317186-2905-1-git-send-email-sagaert.johan@skynet.be>
 (Sagaert Johan's message of "Wed, 7 Nov 2012 20:39:46 +0100")
References: <1352317186-2905-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <874nl1avsi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>

Thanks, but it still doesn't build with a base Qt config here as it
tries to link with QtGui / QtNetwork, which imho doesn't make much sense
for a serial lib.

Now, I know next to nothing about qmake, but it is probably related to
the windows version using QtGui.

Thomas, can you take a look at it?

-- 
Bye, Peter Korsgaard
