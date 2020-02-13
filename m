From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2020 23:20:58 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/sdl2: fix build without threads
In-Reply-To: <20200211214427.315232-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 11 Feb 2020 22:44:27 +0100")
References: <20200211214427.315232-1-fontaine.fabrice@gmail.com>
Message-ID: <87r1yycenp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Drop first patch (not needed since bump to version 2.0.10 and
 >   https://github.com/spurious/SDL-mirror/commit/2601ef1f2d7f998c1d276d1b06cac4ed7feba2e1)
 > - Add a new patch to fix an outstanding build failure

 > Fixes:
 >  - http://autobuild.buildroot.org/results/7f7712c5bd47de4a3fcec1e0d0526fd5a3ecd532

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2:
 >  - Add missing autobuilder link

Committed, thanks.

-- 
Bye, Peter Korsgaard
