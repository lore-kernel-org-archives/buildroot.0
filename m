From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 09 Feb 2017 15:02:23 +0100
Subject: [Buildroot] [PATCH 2/2] libevent: drop openssl static linking
	workaround
In-Reply-To: <20170209102952.6351-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 9 Feb 2017 11:29:52 +0100")
References: <20170209102952.6351-1-peter@korsgaard.com>
 <20170209102952.6351-2-peter@korsgaard.com>
Message-ID: <87shnnmphs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Commit f29bb169cf (libevent: fix openssl detection when statically linking)
 > forced libevent to link against zlib when statically linking against openssl
 > as the configure script failed to do this.

 > Since then libevent has been bumped, and it now uses pkg-config to figure
 > out how to link with openssl, so ensure pkg-config is available and drop the
 > now-unneeded workaround.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
