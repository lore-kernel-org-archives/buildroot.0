From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 23 Apr 2013 16:04:00 +0200
Subject: [Buildroot] [PATCH] busybox: rename patches as per the new
	standard and update 1.21.0 mdev
In-Reply-To: <1366723305-14386-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 23 Apr 2013 10:21:45 -0300")
References: <1366723305-14386-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8761zde433.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Rename patches as per the patch naming policy and update the
 Gustavo> mdev fix patch for 1.21.0 which reinstates subsystem matching
 Gustavo> functionality.

Sorry, I disagree with this rename. I know this is what we discussed at
the dev day, but it imho makes more sense to use the upstream naming
convention for busybox:

http://busybox.net/downloads/fixes-1.21.0/

Could you send a patch that only updates the mdev bugfix instead?

-- 
Bye, Peter Korsgaard
