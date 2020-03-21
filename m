From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Mar 2020 21:09:53 +0100
Subject: [Buildroot] [PATCH] package/ffmpeg: fix typo "--enable-bsfs" ->
 "--enable-bsf"
In-Reply-To: <20200312194517.15568-1-anatoly.borodin@gmail.com> (Anatoly
 Borodin's message of "Thu, 12 Mar 2020 20:45:17 +0100")
References: <20200312194517.15568-1-anatoly.borodin@gmail.com>
Message-ID: <87h7yh4gha.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Anatoly" == Anatoly Borodin <anatoly.borodin@gmail.com> writes:

 > Fix ffmpeg configuration when BR2_PACKAGE_FFMPEG_BSFS is not default ("all"):
 > 	Unknown option "--enable-bsfs=h264_metadata".
 > 	See ./configure --help for available options.
 > 	package/pkg-generic.mk:254: recipe for target '/root/buildroot/output/build/ffmpeg-4.2.2/.stamp_configured' failed

 > The option is named according to the scheme "--enable-SINGULAR=..." /
 > "--disable-PLURAL".

 > The typo is present since the release 2014.02:

 > https://git.buildroot.net/buildroot/commit/package/ffmpeg/ffmpeg.mk?id=62ab07ef769bd6504fe1db144aaac3fd45db9dad

 > Signed-off-by: Anatoly Borodin <anatoly.borodin@gmail.com>

Committed to 2019.02.x, 2019.11.x and 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
