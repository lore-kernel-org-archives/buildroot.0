From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Aug 2016 00:00:03 +0200
Subject: [Buildroot] [PATCH v1] raspberrypi3: fix serial console (add
	enable_uart=1)
In-Reply-To: <20160815220202.486b6192@gmx.net> (Peter Seiderer's message of
 "Mon, 15 Aug 2016 22:02:02 +0200")
References: <1470953002-31897-1-git-send-email-ps.report@gmx.net>
 <A86E382D-5575-4F1A-AD06-D7A6636E9BA0@gmail.com>
 <20160815220202.486b6192@gmx.net>
Message-ID: <87pop8tlwc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

Hi,

 >> This lowers the core clock speed to minimum, so if you are doing some high
 >> definition video decode or interlace then you might want this disabled.
 >> I would recommend keeping it disabled by default.

 > Is this (maybe) a vote for my initial proposed patch ([1]) to add
 > dtoverlay=pi3-miniuart-bt?

 > The current situation for Pi 3 (no dtoerlay, no enable_uart) is no serial console
 > and an unusable default console on HDMI (with a doubled (but unusable) login prompt)...

Yes, I guess having a flakey/less-performant bluetooth connection is
less bad than the alternatives ..

-- 
Bye, Peter Korsgaard
