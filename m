From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 06 Apr 2018 18:54:31 +0200
Subject: [Buildroot] [git commit] package/enlightenment: fix meson
 warning
In-Reply-To: <20180317085654.1F9D983697@busybox.osuosl.org> (Peter Korsgaard's
 message of "Sat, 17 Mar 2018 09:38:57 +0100")
References: <20180317085654.1F9D983697@busybox.osuosl.org>
Message-ID: <876054jmwo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=b582d137a121a456635d29735a27a0144a18b75e
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > --disable-rpath was added by m4/lib-link.m4 with autotools based
 > buildsystem. Now we use meson, we don't have such option anymore.

 > The autotools eet-eet and eldbus_codegen options are named respectively
 > eet and eldbus-codegen with meson.

 > Fixes:
 > WARNING: Unknown command line options: "eet-eet, eldbus_codegen, rpath"

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
