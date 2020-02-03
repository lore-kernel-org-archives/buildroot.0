From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Feb 2020 22:17:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/mutt: fix build without makedoc
In-Reply-To: <20200114180116.1590142-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 14 Jan 2020 19:01:16 +0100")
References: <20200114180116.1590142-1-fontaine.fabrice@gmail.com>
Message-ID: <875zgn1ibs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Cross-compilation of mutt is broken since bump to version 1.13.3 with
 > commit d42603b3872a0eed5a5a3dda13843fb5835f15a5

 > Indeed, since upstream commit 9bacbaa9, even with --disable-doc, mutt
 > tries to generate and install documentation files.
 > Build fails because mutt wants to generate muttrc.man by building (and
 > then running) a makedoc binary with the target cross-compiler (which
 > will obviously fail).

 > See https://gitlab.com/muttmua/mutt/issues/202

 > To fix this issue, retrieve two upstream patches.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/2b01b7e65c0dc0e1191ba48e02e31503958d82fe

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
