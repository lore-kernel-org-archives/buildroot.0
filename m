From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Nov 2018 01:14:42 +0100
Subject: [Buildroot] [PATCH v4 1/4] busybox: rewrite logging init script
In-Reply-To: <CANQCQpbwfJLYkXZhp6jK4TGFT87PTZe7haPof-WQsjpFckxe=Q@mail.gmail.com>
References: <20181103182427.11738-1-casantos@datacom.com.br>
 <20181103182427.11738-2-casantos@datacom.com.br>
 <CANQCQpbwfJLYkXZhp6jK4TGFT87PTZe7haPof-WQsjpFckxe=Q@mail.gmail.com>
Message-ID: <92747f04-1c9a-48d0-9649-228fc490df33@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/11/18 14:57, Matthew Weber wrote:

> I can see this naming change will cause a number of people to end up
> debugging their targets as a custom S01logging will be copied over and
> then the installs of the new files with different names below.  Is
> there any thoughts on making this a visible or obvious change so users
> don't get caught up?

 The best we can doe is to mention it in the release notes.

[snip]
> What's the impact of someone restarting syslogd without stoping klogd first?

 That shouldn't affect klogd, as far as I understand, because klogd uses
standard syslog().

 Regards,
 Arnout
