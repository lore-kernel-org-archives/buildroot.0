From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 01 May 2014 23:50:55 +0200
Subject: [Buildroot] [PATCH v2] libsoxr: new package
In-Reply-To: <1398720880-2424-1-git-send-email-hadrien.boutteville@gmail.com>
 (Hadrien Boutteville's message of "Mon, 28 Apr 2014 23:34:40 +0200")
References: <1398720880-2424-1-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <87a9b1qibk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hadrien" == Hadrien Boutteville <hadrien.boutteville@gmail.com> writes:

 > Building tests fails mainly because of the cross-compilation, so they
 > are disabled for the moment.

 > Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
 > ---
 > Changes v1 -> v2:
 >   - use qstrip to check BR2_ENDIAN variable (Thomas De Schampheleire)
 >   - use tarball instead of the Git repository (Thomas Petazzoni)
 >   - change LICENSE to LGPLv2.1+ (Thomas Petazzoni)
 >   - remove blank line

Committed, thanks.

-- 
Bye, Peter Korsgaard
