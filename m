From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 Nov 2012 17:13:13 +0100
Subject: [Buildroot] [PATCH] Warn the user about the usage of
	output/target as the root filesystem
In-Reply-To: <1353160334-30174-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 17 Nov 2012 14:52:14 +0100")
References: <1353160334-30174-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871ufsus12.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> A very common mistake done by our users is that they use
 Thomas> output/target/ directory as their root filesystem. Even though this is
 Thomas> loudly documented in our Buildroot manual, people don't read
 Thomas> documentation, so it is not sufficient.

Committed with the typo fixed, thanks.

-- 
Bye, Peter Korsgaard
