From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jan 2017 13:42:29 +0100
Subject: [Buildroot] [PATCH] package/espeak: fix build issue with gcc6
In-Reply-To: <20170115184008.7261-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sun, 15 Jan 2017 19:40:08 +0100")
References: <20170115184008.7261-1-romain.naour@gmail.com>
Message-ID: <87bmv7dvm2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > On some architecture, "char" is signed (x86_64, nios2...) so the
 > compiler try to convert int 0xc2 and 0xba to a signed char.
 > This is an error since gcc6 (Wnarrowing).

 > cast string_ordinal init values.

 > Fixes:
 > http://autobuild.buildroot.net/results/bae/baef9888b1979d18171668a675985e3f3b45fda6

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks. Don't forget to send the patch upstream.

-- 
Bye, Peter Korsgaard
