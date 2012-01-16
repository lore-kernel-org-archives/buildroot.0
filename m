From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Jan 2012 16:26:55 +0100
Subject: [Buildroot] [PATCH] linux: remove default for custom kernel
	version
In-Reply-To: <1321657699-7140-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Fri, 18 Nov 2011 23:08:19 +0000")
References: <201111182306.16803.arnout@mind.be>
 <1321657699-7140-1-git-send-email-arnout@mind.be>
Message-ID: <87hazvd5xc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> There already is a default kernel version, so it makes little sense to have
 Arnout> a default custom kernel version as well.  This default breaks the 'make
 Arnout> savedefconfig' if we want to force a specific version.

Committed, thanks.

-- 
Bye, Peter Korsgaard
