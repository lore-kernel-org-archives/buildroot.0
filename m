From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Jul 2018 22:55:14 +0200
Subject: [Buildroot] [PATCH] wireguard: bump to 0.0.20180708
In-Reply-To: <20180710193554.4394-1-Jason@zx2c4.com> (Jason A. Donenfeld's
 message of "Tue, 10 Jul 2018 21:35:54 +0200")
References: <20180710193554.4394-1-Jason@zx2c4.com>
Message-ID: <87sh4qvmj1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jason" == Jason A Donenfeld <Jason@zx2c4.com> writes:

 > * chacha20poly1305: use slow crypto on -rt kernels on arm too
 > Leftover from the last commit of the previous snapshot that we forgot to
 > handle.

The commit message is IMHO almost too wordy to give a quick overview of
what the new version brings, but OK - Committed, thanks.

-- 
Bye, Peter Korsgaard
