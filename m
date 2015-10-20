From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 12:28:30 +0200
Subject: [Buildroot] [git commit] arch/x86: add support for Intel X1000
In-Reply-To: <20151020080505.82B8581E83@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Tue, 20 Oct 2015 10:04:52 +0200")
References: <20151020080505.82B8581E83@busybox.osuosl.org>
Message-ID: <874mhl25rl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: http://git.buildroot.net/buildroot/commit/?id=968f5d5e59195e6e6a9a349ec9a118fb3a50b8b3
 > branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The Intel X1000 is the Pentium class microprocessor that ships with
 > Galileo Gen 1/2. This patch adds changes to arch and toolchain-wrapper
 > to omit the lock prefix for the X1000.

 > [Thomas: tweak commit log and Config.in help text.]

Isn't the -momit-lock-prefix=yes option only supported by fairly recent
binutils versions? If so, older binutils version / external toolchains
shouldn't be available for x1000.

-- 
Bye, Peter Korsgaard
