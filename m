From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Mar 2016 23:08:16 +0100
Subject: [Buildroot] [PATCH] package/busybox: support automatic module
	loading with mdev
In-Reply-To: <1457478205-18515-1-git-send-email-peter@korsgaard.com> (Peter
 Korsgaard's message of "Wed, 9 Mar 2016 00:03:25 +0100")
References: <1457478205-18515-1-git-send-email-peter@korsgaard.com>
Message-ID: <87egbjxq27.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > A recently discussed on the mailing list:
 > http://lists.busybox.net/pipermail/buildroot/2016-February/154189.html

 > Our mdev configuration currently doesn't handle module loading. Fix that by:

 > - Telling mdev to run modprobe on hotplug events providing MODALIAS

 > - Adjust the init script to handle coldplug modalias events (E.G. modules
 >   for which the devices were already present before mdev was added as the
 >   hotplug handler). mdev -s should arguable handle this, but it doesn't.

 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
