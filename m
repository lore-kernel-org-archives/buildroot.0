From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 May 2016 08:29:49 +0200
Subject: [Buildroot] [PATCH 2/3] gst1-plugins-bad: remove rtp plugin
	option
In-Reply-To: <1462304656-17156-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 3 May 2016 16:44:15 -0300")
References: <1462304656-17156-1-git-send-email-gustavo@zacarias.com.ar>
 <1462304656-17156-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87d1p1nhk2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > The plugin was moved from -bad to -good so remove the option.
 > Support in -good was added via 301e8ffb.
 > Add legacy entry to notify users of this, however we can't automatically
 > select the good variant since good might be disabled.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
