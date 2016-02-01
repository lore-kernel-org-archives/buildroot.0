From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Feb 2016 09:27:11 +0100
Subject: [Buildroot] [PATCH v2] package/gstreamer/gst-plugins-ugly: Fix
	cdio-related build errors
In-Reply-To: <1454164681-21418-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sat, 30 Jan 2016 15:38:01 +0100")
References: <1454164681-21418-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87mvrkesyo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes
 > http://autobuild.buildroot.net/results/530/53003be0dc2cb76d497a167023c5c45666fd00b4/
 > http://autobuild.buildroot.net/results/b23/b2393cd50c20da919d6111e15b78d12cc784841f/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > v2: Use _PATCH to include the patch file instead of including it into
 >     the buildroot repository (Arnout)
 >     Also add sha256 hashes for the patch and the upstream tarball

My reply didn't seem to make it to the list, so here goes again:

Committed, thanks.

-- 
Bye, Peter Korsgaard
