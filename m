From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Mar 2014 13:13:20 +0100
Subject: [Buildroot] [PATCH] jack2: fix missing alsa-lib feature
	dependency
In-Reply-To: <1394435378-32063-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Mon, 10 Mar 2014 08:09:38 +0100")
References: <1394435378-32063-1-git-send-email-s.martin49@gmail.com>
Message-ID: <87txb6s13z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > jack2 needs snd_hwdep support.
 > Fixes:
 >   http://autobuild.buildroot.net/results/4c3/4c3b4f1db5c1aadfd8de59f7a655a7644f1bc1be/

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
