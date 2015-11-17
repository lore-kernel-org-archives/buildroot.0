From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2015 17:07:23 +0100
Subject: [Buildroot] [PATCH] pulseaudio: fix build issue with old gcc
	versions
In-Reply-To: <1447763274-4201-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 17 Nov 2015 13:27:54 +0100")
References: <1447763274-4201-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87y4dwd2ys.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit adds a patch to pulseaudio (already submitted upstream)
 > that avoids a structure redefinition build failure that occurs with
 > old gcc versions.

 > Fixes:

 >   http://autobuild.buildroot.org/results/a1e/a1e7e59f9c65a6ce38800439c78b7808048ad708/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
