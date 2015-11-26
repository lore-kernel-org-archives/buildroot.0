From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2015 22:17:26 +0100
Subject: [Buildroot] [PATCH] qt5base: support OVERRIDE_SRCDIR
In-Reply-To: <1448400109-32767-1-git-send-email-peter@korsgaard.com> (Peter
 Korsgaard's message of "Tue, 24 Nov 2015 22:21:49 +0100")
References: <1448400109-32767-1-git-send-email-peter@korsgaard.com>
Message-ID: <87h9k8v4t5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > With OVERRIDE_SRCDIR we don't apply any of the qt5base patches, but the
 > custom specs files are needed to be able to build - So install these in the
 > configure step instead of having them as a patch.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
