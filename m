From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Oct 2018 09:55:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: fix linking with tremor
In-Reply-To: <20181001173118.26686-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Mon, 1 Oct 2018 19:31:18 +0200")
References: <20181001173118.26686-1-bernd.kuhls@t-online.de>
Message-ID: <87murvxy4u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Patch 0004 is not enough anymore to fix linking with tremor (provides
 > libvorbisidec) so we provide the proper content for VORBIS_LIBS.

 > Fixes
 > http://autobuild.buildroot.net/results/15a/15a3c5b90de6c67db9887e3db67b3568f6d18e3a/
 > http://autobuild.buildroot.net/results/946/946f397bb81ce2c69384fa1e378c40600fd405b6/
 > http://autobuild.buildroot.net/results/f5d/f5d9f3df78626178274c1be878a2ae0b90394885/
 > http://autobuild.buildroot.net/results/2e5/2e5dc746a59798a56d3127aadc88593fc584c010/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
