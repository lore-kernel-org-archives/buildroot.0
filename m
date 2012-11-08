From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Nov 2012 00:33:32 +0100
Subject: [Buildroot] [PATCH 1/1] qextserialport : fix download and bump
	version
In-Reply-To: <20121108000209.223413fe@skate> (Thomas Petazzoni's message of
 "Thu, 8 Nov 2012 00:02:09 +0100")
References: <1352317186-2905-1-git-send-email-sagaert.johan@skynet.be>
 <874nl1avsi.fsf@dell.be.48ers.dk> <20121108000209.223413fe@skate>
Message-ID: <87haoz8yb7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Sagaert> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
 >> 
 >> Thanks, but it still doesn't build with a base Qt config here as it
 >> tries to link with QtGui / QtNetwork, which imho doesn't make much sense
 >> for a serial lib.
 >> 
 >> Now, I know next to nothing about qmake, but it is probably related to
 >> the windows version using QtGui.
 >> 
 >> Thomas, can you take a look at it?

 Thomas> I'll have a look, but I can't say when. I'll most likely be
 Thomas> very busy over the next 3 weeks or so.

Ok, then I'll commit Johan's patch. It's not 100% correct, but it's
atleast better than what we have now (where download even doesn't work).

-- 
Bye, Peter Korsgaard
