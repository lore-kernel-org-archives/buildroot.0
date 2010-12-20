From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Mon, 20 Dec 2010 16:37:00 +0000
Subject: [Buildroot] [PATCH v2] buildroot:download: Add option to
 download SVN or GIT repository with version control information.
In-Reply-To: <20101220170850.78a29a16@surf>
References: <1292492992-15797-1-git-send-email-sonic.adi@gmail.com>
	<20101217113436.43ec2958@surf>
	<1292591501.6496.58.camel@dubciaranr0.verifone.com>
	<20101220150504.4dcf2e18@surf>
	<1292861049.2560.17.camel@dubciaranr0.verifone.com>
	<20101220170850.78a29a16@surf>
Message-ID: <1292863020.2560.22.camel@dubciaranr0.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ar Luan, 2010-12-20 ag 17:08 +0100, scr?obh Thomas Petazzoni:

> The idea is that if you override the source directory of a package with
> <pkg>_OVERRIDE_DIR, Buildroot wouldn't look at <pkg>_VERSION anymore.
> It's completely up to the developer to use <pkg>_OVERRIDE_DIR to point
> to a directory that contains the correct version for the sources.

But going back to what I said eariler, it'd be a pity if Buildroot
didn't help out with this.  Couldn't the VCS feature *use* the override
feature as well as adding some support for actually managing these
repositories?

> I haven't thought too much, but there are clearly issues that needs to
> be solved. For example when a given package is compiled once for the
> target and once for the host.

Yes, and this is another reason simple symbolic links won't work,
unfortunately.
