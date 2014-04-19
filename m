From: Maarten ter Huurne <maarten@treewalker.org>
Date: Sat, 19 Apr 2014 21:59:25 +0200
Subject: [Buildroot] wget autoreconfigure problem
In-Reply-To: <1899265.ckz4x4Fb2x@hyperion>
References: <1899265.ckz4x4Fb2x@hyperion>
Message-ID: <17479328.UQEUV7VmAV@hyperion>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 19 April 2014 08:02:56 I wrote:

> I'm running into a problem with wget and gettext. [...]

Paul Cercueil pointed me towards commit 1da2bb5e and 1b9bfce1 which fix the 
issue. We were using 2014.02 though, which predates those commits.

Bye,
		Maarten
