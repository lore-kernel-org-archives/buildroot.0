From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Jun 2020 09:05:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/dtc: bump version to 1.6.0
In-Reply-To: <20200419154300.203136-1-juju@cotds.org> (Julien Olivain's
 message of "Sun, 19 Apr 2020 17:43:00 +0200")
References: <20200419154300.203136-1-juju@cotds.org>
Message-ID: <871rmydk2l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien Olivain <juju@cotds.org> writes:

 > When host compiler is gcc 10 (for example on Fedora 32), dtc 1.5.1
 > fail to build with the error:
 > /usr/bin/ld: dtc-parser.tab.o:(.bss+0x20): multiple definition of `yylloc'; dtc-lexer.lex.o:(.bss+0x0): first defined here
 > collect2: error: ld returned 1 exit status

 > dtc 1.6.0 fixes this issue in the commit:
 > https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/?id=0e9225eb0dfec51def612b928d2f1836b092bc7e

 > Also adopt new spacing convention in .hash files (two spaces).

 > Signed-off-by: Julien Olivain <juju@cotds.org>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
