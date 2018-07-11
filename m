From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Jul 2018 22:33:41 +0200
Subject: [Buildroot] [PATCH] wireguard: bump to 0.0.20180708
In-Reply-To: <CAHmME9qJ6hRtG9ONUa0ffVZScnWoXtk38YVcXEXh46cbj80PkQ@mail.gmail.com>
 (Jason A. Donenfeld's message of "Tue, 10 Jul 2018 22:56:12 +0200")
References: <20180710193554.4394-1-Jason@zx2c4.com>
 <87sh4qvmj1.fsf@dell.be.48ers.dk>
 <CAHmME9qJ6hRtG9ONUa0ffVZScnWoXtk38YVcXEXh46cbj80PkQ@mail.gmail.com>
Message-ID: <87h8l5v7fe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jason" == Jason A Donenfeld <Jason@zx2c4.com> writes:

 > On Tue, Jul 10, 2018 at 10:55 PM Peter Korsgaard <peter@korsgaard.com> wrote:
 >> 
 >> >>>>> "Jason" == Jason A Donenfeld <Jason@zx2c4.com> writes:
 >> 
 >> > * chacha20poly1305: use slow crypto on -rt kernels on arm too
 >> > Leftover from the last commit of the previous snapshot that we forgot to
 >> > handle.
 >> 
 >> The commit message is IMHO almost too wordy to give a quick overview of
 >> what the new version brings, but OK - Committed, thanks.

 > It's just a concatenation of the mailing list posts for the last three
 > bumps that buildroot missed.

Correct. Again, something less detailed and faster readable (E.G. only
the highlights of the changes applicable to Buildroot) would be more in
line with other version bumps we do here.

-- 
Bye, Peter Korsgaard
