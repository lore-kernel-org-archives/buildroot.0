From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 12 Jan 2015 17:01:37 +0100
Subject: [Buildroot] [PATCH v2 4/4] dtc: add patches for raspberry pi
 overlay support
In-Reply-To: <CANQCQpaCnaOxWDo4d+PbjFGxUWeUKdWs11piPfn1+UQZ_Lxgww@mail.gmail.com>
References: <1421000166-24963-1-git-send-email-ps.report@gmx.net>
 <1421000166-24963-4-git-send-email-ps.report@gmx.net>,
 <CANQCQpaCnaOxWDo4d+PbjFGxUWeUKdWs11piPfn1+UQZ_Lxgww@mail.gmail.com>
Message-ID: <trinity-dff92bff-3fff-4490-88d0-d346b7d96ccd-1421078497336@3capp-gmx-bs23>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matthew,

> Gesendet: Montag, 12. Januar 2015 um 14:57 Uhr
> Von: "Matthew Weber" <matthew.weber@rockwellcollins.com>
> An: "Peter Seiderer" <ps.report@gmx.net>
> Cc: buildroot at busybox.net
> Betreff: Re: [Buildroot] [PATCH v2 4/4] dtc: add patches for raspberry pi overlay support
>
> Peter,
> 
> On Sun, Jan 11, 2015 at 12:16 PM, Peter Seiderer <ps.report@gmx.net> wrote:
> > See [1] for documentation of raspberry pi kernel dt overlay support.
> 
> Do you happen to know if this overlay support is identical to the
> approach used in the beaglebone dts overlays?  (I'm guessing so)

Looking at [2] I think so too, same input format, same
dtc paraemter '-@' and same source [3] for the dtc tool
enhancement....

> Currently the beaglebone support in Buildroot lacks overlay support.
> So if the capability is similar, I'll work on an update to the
> beaglebone package to use the dtc package instead of the linux kernel
> dtc (I think the kernel dtc install may need a new check to see if the
> dtc is enabled to prevent it from installing the kernel dtc).

Good point, will add kernel dtc install prevention (missed this one until now)
on next patch iteration...

Regards,
Peter

[2] https://learn.adafruit.com/introduction-to-the-beaglebone-black-device-tree/compiling-an-overlay
[3] https://raw.githubusercontent.com/RobertCNelson/tools/master/pkgs/dtc.sh

> <snip>
> 
> -- 
> Matthew L Weber / Pr Software Engineer
> Airborne Information Systems / Security Systems and Software
> www.rockwellcollins.com
> 
