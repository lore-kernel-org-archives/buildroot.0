From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 20 Jan 2013 11:22:02 -0300
Subject: [Buildroot] [PATCH RFC] Fix avr32 build using internal toolchain
In-Reply-To: <CAHt8ZCOMQR8NjrsQzcWqRz3hd2EUc+X_0osKOfn-8c=1wY59_Q@mail.gmail.com>
References: <1358460970-2081-1-git-send-email-spdawson@gmail.com>
 <20130119113852.6d35aa94@skate>
 <CAHt8ZCOH9FgqzkB2KHJSSBc3k76-07iYNfsQ_rjzQCzOFGLEAg@mail.gmail.com>
 <50FBE8EC.6060602@zacarias.com.ar>
 <CAHt8ZCOMQR8NjrsQzcWqRz3hd2EUc+X_0osKOfn-8c=1wY59_Q@mail.gmail.com>
Message-ID: <50FBFD8A.1030606@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/20/2013 10:22 AM, Simon Dawson wrote:

>> Testing and fixing is an issue on the toolchain side when there's no
>> upgrade path possible.
> 
> I don't quite follow your meaning here, I'm afraid.

Some of the breakage is toolchain-related and we can't upgrade it.
Most of the time it's gcc IIRC.
Like the internal compiler errors for external toolchains, other than
blacklisting/disabling packages there's not much to do.

>> Maybe we can keep it and start marking broken packages as !BR2_avr32 ?
>> That may be a rough ride though with all the dependencies.
> 
> I think that's pretty much where we are right now, isn't it?

I don't recall if that's what was agreed on the meetings (particularly
since i never went to one).
But at some point it won't be a workable compromise i'm afraid.
Regards.
