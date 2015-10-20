From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 11:36:16 +0200
Subject: [Buildroot] [PATCH] syslog-ng: Specify location of libesmtp
In-Reply-To: <1445328991-29416-1-git-send-email-judge.packham@gmail.com>
 (Chris Packham's message of "Tue, 20 Oct 2015 21:16:31 +1300")
References: <1445328991-29416-1-git-send-email-judge.packham@gmail.com>
Message-ID: <87fv15286n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Packham <judge.packham@gmail.com> writes:

 > If --with-libesmtp is omitted a host tool is invoked to detect the
 > location of the library and headers, which is obviously the wrong thing
 > for a cross-compile environment. Explicitly add --with-libesmtp to
 > resolve this.

 > Fixes:
 > http://git.buildroot.net/buildroot/commit/?id=539acb7500588d0a277357cf831c9f25f770578d
 > http://git.buildroot.net/buildroot/commit/?id=01f41585a78406f6e830d5eaf4413a983812a299

 > Signed-off-by: Chris Packham <judge.packham@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
