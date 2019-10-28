From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Oct 2019 14:22:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/sdl_mixer: disable parallel
 build
In-Reply-To: <20191010185421.19153-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 10 Oct 2019 20:54:21 +0200")
References: <20191010185421.19153-1-fontaine.fabrice@gmail.com>
Message-ID: <87a79l6m3u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build sometimes fails on:
 > Fatal error: can't create build/load_aiff.o: No such file or directory

 > Fixes:
 >  - http://autobuild.buildroot.org/results/c800ef60d8af0cd76f2f1de9aff573120ebd8ada

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
