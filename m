From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Oct 2018 21:00:38 +0100
Subject: [Buildroot] [PATCH 1/1] synergy: needs gcc >= 4.9
In-Reply-To: <20181029153533.6897-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 29 Oct 2018 16:35:33 +0100")
References: <20181029153533.6897-1-fontaine.fabrice@gmail.com>
Message-ID: <87wopzdx21.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Since version 1.9.0 and
 > https://github.com/symless/synergy-core/commit/c0376e9e2f659aec23a748f9a8d8ee6cd82f1281,
 > synergy needs C++14 so add a dependency on
 > BR2_TOOLCHAIN_GCC_AT_LEAST_4_9

 > Fixes:
 >  - http://autobuild.buildroot.org/results/c4646ee9342ea8bd906bfe2b29996c48cb403ccc

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
