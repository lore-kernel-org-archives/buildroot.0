From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Jul 2017 21:37:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/transmission: fix gtk support
In-Reply-To: <20170710175137.1402-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Mon, 10 Jul 2017 19:51:37 +0200")
References: <20170710175137.1402-1-bernd.kuhls@t-online.de>
Message-ID: <87a84asr2s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Gtk support is controlled by ARG_WITH since
 > https://github.com/transmission/transmission/commit/2ccc2bbbfe2e4a26dfeaa13b56c412ea0af4ebe4

 > Fixes a build error if libgtk2/3 was built before transmission:
 > http://autobuild.buildroot.net/results/6b6/6b6ce352a9edfe3aaba82be143092a878e7715ed/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

So this has been broken since (atleast) the version bump in early 2016?
Wow.

Committed, thanks.

-- 
Bye, Peter Korsgaard
