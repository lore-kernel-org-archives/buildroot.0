From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Sep 2013 23:25:42 +0200
Subject: [Buildroot] [PATCHv2 11/14] toolchain: move elf2flt option
	inclusion to toolchain-buildroot/Config.in
In-Reply-To: <1378138000-12739-12-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 2 Sep 2013 18:06:37 +0200")
References: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378138000-12739-12-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k3ihixpl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The only remaining thing in toolchain-buildroot/Config.in.2 is the
 Thomas> inclusion of the elf2flt option. It doesn't really make sense to have
 Thomas> a separate Config.in file for that, so let's move this to
 Thomas> toolchain-buildroot/Config.in.

Committed, thanks.

-- 
Bye, Peter Korsgaard
