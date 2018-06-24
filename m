From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Jun 2018 23:53:55 +0200
Subject: [Buildroot] [PATCH 1/1] domoticz: remove boost hack for
 powerpc64le
In-Reply-To: <20180624141505.31561-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 24 Jun 2018 16:15:05 +0200")
References: <20180624141505.31561-1-fontaine.fabrice@gmail.com>
Message-ID: <87k1qnetqk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Since boost 1.67, seed_rng.hpp has been removed:
 > https://github.com/boostorg/uuid/commit/a8a1ec3d826b04d2c842e79ecd18cff6a991fd29

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
