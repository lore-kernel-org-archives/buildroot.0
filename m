From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Apr 2019 08:32:28 +0200
Subject: [Buildroot] [PATCH] package/gstreamer1/gst-omx: make variant
 mutually exclusive
In-Reply-To: <20190401220228.4923-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Tue, 2 Apr 2019 00:02:28 +0200")
References: <20190401220228.4923-1-arnout@mind.be>
Message-ID: <877eccj4sj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > Commit cc419509506 added the GST_OMX_VARIANT option which gets a default
 > value that gets overridden by subsequent conditions. check-package
 > doesn't like that, so instead make the three cases explicitly mutually
 > exclusive.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

Funky - I do run check-package in a post-commit hook, but I must have
missed the warnings.

Committed, thanks.

-- 
Bye, Peter Korsgaard
