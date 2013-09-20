From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 20 Sep 2013 15:18:51 +0200
Subject: [Buildroot] [PATCH 1/1] erlang: pass erl_xcomp_sysroot to
	configure
In-Reply-To: <1379087161-23062-1-git-send-email-fhunleth@troodon-software.com>
 (Frank Hunleth's message of "Fri, 13 Sep 2013 11:46:01 -0400")
References: <1379087161-23062-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <87bo3nd41w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:

 Frank> This is required for building the 'crypto', 'odbc', 'ssh'
 Frank> and 'ssl' Erlang applications. These apps are skipped
 Frank> regardless of whether they're enabled and their dependencies
 Frank> can be met if this environment variable isn't set.

Committed, thanks.

-- 
Bye, Peter Korsgaard
