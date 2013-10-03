From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 03 Oct 2013 15:04:31 +0200
Subject: [Buildroot] [PATCH v2 1/1] gnupg: option to include RSA support.
In-Reply-To: <1380500720-29245-1-git-send-email-psanford@nearbuysystems.com>
 (Peter Sanford's message of "Sun, 29 Sep 2013 17:25:20 -0700")
References: <1380500720-29245-1-git-send-email-psanford@nearbuysystems.com>
Message-ID: <87zjqqmrog.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Sanford <psanford@nearbuysystems.com> writes:

 Peter> gnupg is compiled with --enable-minimal flag. This produces a
 Peter> binary that only supports ElGamal and DSA public key algorithms.

 Peter> RSA has been the default for `gpg --gen-key` since 2009, so it
 Peter> makes sense to be able to build a gnupg binary that supports it.

Committed, thanks.

-- 
Bye, Peter Korsgaard
