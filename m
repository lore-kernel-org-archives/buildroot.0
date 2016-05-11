From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 May 2016 09:29:45 +0200
Subject: [Buildroot] Clarification about init system
In-Reply-To: <5731B0DD.1080201@gmail.com> (Marco Trapanese's message of "Tue, 
 10 May 2016 11:58:53 +0200")
References: <5731B0DD.1080201@gmail.com>
Message-ID: <87oa8djbme.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marco" == Marco Trapanese <marcotrapanese@gmail.com> writes:

Hi,

 > In the manual I read:
 >     systemd will be useful on relatively complex embedded systems, for
 >     example the ones requiring D-Bus and services communicating
 >     between each other

 > Currently I'm using busybox, but I'm facing issues to get pulseaudio,
 > bluez and ofono to communicate each other via dbus.
 > Of course it might be something wrong in my configuration.

 > Generally speaking, do you recommend to use systemd or I can safely
 > rely on busybox and just digging further my issues?

Systemd is fine, but it shouldn't make any difference regarding
functionality of pulseaudio (and if it does, it sounds like a bug we
should fix).

-- 
Bye, Peter Korsgaard
