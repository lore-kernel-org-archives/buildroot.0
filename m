From: Steven Noonan <steven@uplinklabs.net>
Date: Thu, 19 Mar 2015 12:50:54 -0700
Subject: [Buildroot] RFC: systemd and service files cleanup
In-Reply-To: <CANPyyuO9hfyObgWWPjh7m=oghSs=qWWvsG28q+P=7F8W4NQnYg@mail.gmail.com>
References: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
 <CAKbGBLj66AmB6kxrp1utLmZ+AhWN+-0aDERdD=4FtAi=UHT_ig@mail.gmail.com>
 <CANPyyuO9hfyObgWWPjh7m=oghSs=qWWvsG28q+P=7F8W4NQnYg@mail.gmail.com>
Message-ID: <CAKbGBLhc8Wftu8pSVM8jNvRRpoSV=e0p5eomh4=+u8wg1VxVxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 19, 2015 at 12:43 PM, Mike Williams <mike@mikebwilliams.com> wrote:
>> I come from the Arch Linux world, so I made a new skeleton that
>> matches the Arch base filesystem layout: with /bin, /sbin, /usr/bin,
>> and /usr/sbin all unified (likewise with /lib and /usr/lib). I haven't
>> convinced myself to post the series because I can't think of a
>> particularly good justification for it in the Buildroot context.
>
> I'm working that way myself, I don't know what use cases in Buildroot
> still require the split.

We could consider offering it as an experimental alternative to the
default skeleton (just add another "choice" in kconfig, as I did in my
patch series). And open a discussion about unifying the directory
structure. It's certainly possible to support both use cases, though
it does require more testing.
