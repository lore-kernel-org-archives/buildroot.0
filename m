From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 13 Jun 2014 22:57:51 +0200
Subject: [Buildroot] [PATCH v2] gcc 4.8.x does not compile a working
	kernel for sparc
In-Reply-To: <20140613170047.GA10615@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Fri, 13 Jun 2014 19:00:48 +0200")
References: <20140613170047.GA10615@waldemar-brodkorb.de>
Message-ID: <87ppiccysw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Since the switch to 4.8.x as default, the qemu-sparc target is broken.
 > For a gcc bug report see here:
 > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60624

 > Switch back to gcc 4.7.x as default for sparc.
 > Disable 4.8/4.9 as suggested by Thomas Petazzoni.
 > I even disabled gcc snapshot, it works right now, because
 > it is an old 4.8.0 snapshot by default, but as soon as this is updated
 > sparc build will break.

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
