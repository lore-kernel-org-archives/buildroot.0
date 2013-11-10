From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Nov 2013 00:08:10 +0100
Subject: [Buildroot] [PATCH v3 1/1] Avoid toolchain download when it is
	preinstalled
In-Reply-To: <527A962E.4090402@gezedo.com> (Laurent GONZALEZ's message of
 "Wed, 06 Nov 2013 20:19:10 +0100")
References: <527A962E.4090402@gezedo.com>
Message-ID: <87bo1rc0th.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Laurent" == Laurent GONZALEZ <br2@gezedo.com> writes:

> For configurations using a toolchain that is preinstalled on
> the host, <pkg>_SITE and <pkg>_SOURCE variables must be kept
> empty to avoid downloading any toolchain package.
> The actual implementation has been proposed by Thomas Petazzoni.

> Signed-off-by: GONZALEZ Laurent <br2@gezedo.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
