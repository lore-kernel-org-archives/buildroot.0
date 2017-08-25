From: Jonas <qiaohuang178@gmail.com>
Date: Thu, 24 Aug 2017 22:48:41 -0700 (MST)
Subject: [Buildroot] pulseaudio isn't work on buildroot-2017.02.5
In-Reply-To: <20170824192644.56481029@windsurf>
References: <1503571325385-173857.post@n4.nabble.com>
 <20170824192644.56481029@windsurf>
Message-ID: <1503640121686-173903.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

thank you for your reply.

I try to set "BR2_PACKAGE_PULSEAUDIO_DAEMON".

# ps
...
  223 root     -sh
  224 root     /sbin/getty -L tty1 0 vt100
  256 pulse    pulseaudio --system --daemonize
  260 root     ps

it seen works in system mode, but I want to use "pactl" command.
I need set source and sink.

I get this error message:
# pactl stat
Connection failure: Access denied

#pactl list sources short
Connection failure: Access denied

#pactl list sink short
Connection failure: Access denied

Could you help me again.
Thank you very much.

Thanks, 
Jonas.



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/pulseaudio-isn-t-work-on-buildroot-2017-02-5-tp173857p173903.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
