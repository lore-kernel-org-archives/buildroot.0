From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 04 Jan 2017 17:11:42 +0100
Subject: [Buildroot] [PATCH] alsa-utils: disable manpages generation
	from reStructured text
In-Reply-To: <aa4954d6b24aa8262aa80964c01abe78de42b9d0.1483265273.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sun, 1 Jan 2017 12:07:53 +0200")
References: <aa4954d6b24aa8262aa80964c01abe78de42b9d0.1483265273.git.baruch@tkos.co.il>
Message-ID: <87k2aa24ap.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The alsaucm man page rst source file is missing in the tarball. When rst2man
 > is detected on the host, build fails:

 > make[2]: *** No rule to make target 'alsaucm.1', needed by 'all-am'.  Stop.

 > Upstream added[1] the missing file to the tarball to fix this issue. But since
 > we don't need the manpage to begin with, just disable rst2man to shorten build
 > time by a few milliseconds.

 > [1] http://git.alsa-project.org/?p=alsa-utils.git;a=commitdiff;h=c6bdde171e1532f7b37333a5a746b6e662f12c53

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
