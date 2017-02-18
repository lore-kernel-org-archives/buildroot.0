From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Feb 2017 15:47:28 +0100
Subject: [Buildroot] [PATCHv2 2/3] gstreamer1: fix unaligned detection
	for or1k
In-Reply-To: <20170218131805.20242-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 18 Feb 2017 14:18:04 +0100")
References: <20170218131805.20242-1-peter@korsgaard.com>
 <20170218131805.20242-2-peter@korsgaard.com>
Message-ID: <87wpcnsghr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/717/717d78ce0935749f477bdf3133b6f20057a28c01/

 > Add patch to fix unaligned detection for or1k.  Patch submitted upstream:

 > https://bugzilla.gnome.org/show_bug.cgi?id=778866

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
