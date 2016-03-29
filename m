From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 14:45:10 +0200
Subject: [Buildroot] [PATCH v4 18/19] package/tvheadend: bump version
In-Reply-To: <1459194585-12593-19-git-send-email-bernd.kuhls@t-online.de>
References: <1459194585-12593-1-git-send-email-bernd.kuhls@t-online.de>
 <1459194585-12593-19-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160329144510.0510cbe8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Mar 2016 21:49:44 +0200, Bernd Kuhls wrote:
> Updated ffmpeg option name after upstream renamed it:
> https://github.com/tvheadend/tvheadend/commit/1359effe28a0381b8c9cbd362d6e144fb87b00fc#diff-e2d5a00791bce9a01f99bc6fd613a39dR37
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

This is causing some build failures:

   http://autobuild.buildroot.org/results/32c/32c6e6eece7e3b4f428524114f92e9a8999568e4/build-end.log

It seems like tvheadend is no longer compatible with the current ffmpeg
version, since we haven't bumped to ffmpeg 3.0.

I guess I should revert the tvheadend bump for now?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
