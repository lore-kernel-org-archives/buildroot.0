From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Mar 2013 13:57:57 +0100
Subject: [Buildroot] [PATCH 21/22] dependencies: check that a full perl
	installation is available
In-Reply-To: <1364113606-20836-22-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 24 Mar 2013 09:26:45 +0100")
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364113606-20836-22-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87boa9kl9m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The host-autoconf build process requires a full Perl installation, or
 Thomas> at least a Perl installation that has the Data::Dumper module
 Thomas> installed. On a basic Debian system, only 'perl-base' is installed,
 Thomas> but Data::Dumper is in the 'perl' package.

Committed, thanks.

-- 
Bye, Peter Korsgaard
