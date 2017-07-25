From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Jul 2017 00:13:46 +0200
Subject: [Buildroot] [PATCH 1/2] package/Makefile.in: add host-cc-option
	macro
In-Reply-To: <20170703084107.5620-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Mon, 3 Jul 2017 10:41:06 +0200")
References: <20170703084107.5620-1-arnout@mind.be>
Message-ID: <87a83sxizp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > This macro allows to test if HOSTCC supports a specific option. It is
 > needed to pass '-no-pie' on recent Debian, Ubuntu and Gentoo hosts.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
