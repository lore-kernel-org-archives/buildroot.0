From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Feb 2014 15:28:37 +0100
Subject: [Buildroot] [PATCH v2 1/1] icu: detect and add compiler symbol
	prefix to the assembly code
In-Reply-To: <1391519206-17889-1-git-send-email-rjbarnet@rockwellcollins.com>
 (Ryan Barnett's message of "Tue, 4 Feb 2014 14:06:46 +0100")
References: <1391519206-17889-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <8761ov54ve.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <ryanbarnett3@gmail.com> writes:

 > From: Sonic Zhang <sonic.zhang@analog.com>
 > Some compiler, such as Blackfin GNU compiler, prefix a charater to any
 > C symbol in generated assembly code. If any assembly symbol is invoked
 > from C code, it needs to be prefixed as well.

 > Note: since autoreconf doesn't work with this package because automake
 > isn't support

 > Fixes:
 >   http://autobuild.buildroot.net/results/c40a22814b405de2c5c75139cfc393c863ed4b81/

 > [Ryan: add information about why patching configure is ok]
 > [Ryan: add renaming of patches to be consistent with standard]

 > Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
 > Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
