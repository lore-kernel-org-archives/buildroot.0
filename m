From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jul 2018 22:45:57 +0200
Subject: [Buildroot] [PATCH] package/binutils: bump to version 2.31.1
In-Reply-To: <1531915674-1492-1-git-send-email-romain.naour@smile.fr> (Romain
 Naour's message of "Wed, 18 Jul 2018 14:07:54 +0200")
References: <1531915674-1492-1-git-send-email-romain.naour@smile.fr>
Message-ID: <87wotsi86y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > From the release note:
 >   This is a point release over the previous 2.31 version, which was
 >   necessary as a source file was accidentally omitted from that
 >   release.

 >   This release also contains a fix for PR gold/23409 where the gold
 >   linker could end up creating duplicate copies of some symbols.

 > https://sourceware.org/ml/binutils/2018-07/msg00286.html

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
