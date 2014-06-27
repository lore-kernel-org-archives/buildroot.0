From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 27 Jun 2014 13:40:27 +0200
Subject: [Buildroot] [PATCH] haserl: add preprocessed lualib file so
	host-lua isn't needed
In-Reply-To: <1403766195-7357-1-git-send-email-jcmvbkbc@gmail.com> (Max
 Filippov's message of "Thu, 26 Jun 2014 11:03:15 +0400")
References: <1403766195-7357-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <87fviqlgwk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > Updated for haserl-0.9.33
 > Fixes:
 >   http://autobuild.buildroot.net/results/663/663daf3d61c12b68dbe5ff42494a3d0d45dfb832/

Thanks. We should also remove the old unused 0.9.30 version.

With this applied, we can also cleanup haserl.mk to not pass
lua2c_LDFLAGS or depend on host-lua.

Committed with these changes, thanks.

-- 
Bye, Peter Korsgaard
