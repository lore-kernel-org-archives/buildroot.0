From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Jul 2017 17:48:40 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: fix webrtc option
In-Reply-To: <20170704113141.2D5C67FCBD@busybox.osuosl.org> (Peter Korsgaard's
 message of "Tue, 4 Jul 2017 11:50:54 +0200")
References: <20170704113141.2D5C67FCBD@busybox.osuosl.org>
Message-ID: <87lgo419uv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=4c06d2490a07f0b88f42c56c7409899fd2f5608a
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > When the WebRTC plugin option was introduced in commit
 > ee267886bc090335dd94c97dca1c294addccc090 ("gst1-plugins-bad: enable
 > webrtc plugin"), it was incorrect added as "webrtc", while the actual
 > name of the plugin and corresponding configure option is "webrtcdsp".

 > This commit therefore fixes the .mk file to use the correct name. And
 > also, since we want to keep Buildroot option consistent with the name
 > of the GStreamer plugins, it renames the Config.in option as well, and
 > introduces the necessary Config.in.legacy handling.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
