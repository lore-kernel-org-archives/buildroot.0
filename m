From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 May 2016 08:29:21 +0200
Subject: [Buildroot] [PATCH 1/3] gst1-plugins-bad: remove mpg123 plugin
	option
In-Reply-To: <1462304656-17156-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 3 May 2016 16:44:14 -0300")
References: <1462304656-17156-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87h9ednhku.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > The plugin was moved from -bad to -ugly so remove the option.
 > Support in -ugly was added via 30cde9a3.
 > Add legacy entry to notify users of this, however we can't automatically
 > select the ugly variant since ugly might be disabled.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
