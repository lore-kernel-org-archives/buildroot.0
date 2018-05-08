From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 8 May 2018 08:23:42 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-04-25
In-Reply-To: <18cd8156-03bc-05cf-5343-dec77dbf01a9@gmail.com>
References: <20180426060013.EAB262079F@mail.bootlin.com>
 <18cd8156-03bc-05cf-5343-dec77dbf01a9@gmail.com>
Message-ID: <CANQCQpaTbUMwcPu0TU5Q0FQ2Df5B+8kBW2SwXF4mX1Kinc1WsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Sun, Apr 29, 2018 at 5:15 PM, Romain Naour <romain.naour@gmail.com> wrote:
>
> Hi All,
>
> git bisect helped to find a patch [1] fixing an infinite loop in RTL DSE

I've got another microblaze bug I'm working on identifying between
GCC6.4 and 7.3.  Any general tips on bisecting GCC?  (What seems to be
working is the following.... I went into buildroot and rewrote the GCC
initial/final/toplevel mk to use a local site method and removed all
source/version stuff.  Then built (for now) ignoring the buildroot
patches against released versions.

Matt
