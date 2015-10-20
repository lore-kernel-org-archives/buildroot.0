From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 16:35:00 +0200
Subject: [Buildroot] [PATCH] gdb: enable host-gdb on aarch64
In-Reply-To: <20151020132007.GA1289@vostro> (Alex Suykov's message of "Tue, 20
 Oct 2015 16:20:07 +0300")
References: <20151020132007.GA1289@vostro>
Message-ID: <87twplip63.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alex" == Alex Suykov <alex.suykov@gmail.com> writes:

 > gdb has full support for aarch64 since version 7.6,
 > current minimum is 7.7.1.
 > Target build was re-enabled over a year ago, but host-gdb was not.

 > Related commits:
 > 0e49733b306b353aad3a29a2c7a6faf25841ef0b gdb disabled for aarch64
 > 4372449a4f8e16f763c7d5a0c125ca015a7cbef6 target-gdb re-enabled

 > Signed-off-by: Alex Suykov <alex.suykov@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
