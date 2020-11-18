From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Nov 2020 10:48:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/jpeg-turbo: fix license hash
In-Reply-To: <20201118070006.200706-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 18 Nov 2020 08:00:06 +0100")
References: <20201118070006.200706-1-fontaine.fabrice@gmail.com>
Message-ID: <87lfezxafz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit 105d61c85062b18bc9555011f909c8c8a5a33277 forgot to update hash of
 > LICENSE.md (update in year:
 > https://github.com/libjpeg-turbo/libjpeg-turbo/commit/00607ec260efa4cfe10f9b36d6e3d3590ae92d79)

 > While at it, also update indentation in hash file (two spaces)

 > Fixes:
 >  - http://autobuild.buildroot.org/results/66fb5c0171af73d4c1c93241b285fac8f8f494f7

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
