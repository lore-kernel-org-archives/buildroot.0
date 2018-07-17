From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 17 Jul 2018 06:25:28 -0500
Subject: [Buildroot] [PATCH v2 6/6] support/testing/tests/core: SSP &
 hardening flags
In-Reply-To: <20180717100611.1d443355@windsurf>
References: <20180717030420.12009-1-matthew.weber@rockwellcollins.com>
 <20180717100611.1d443355@windsurf>
Message-ID: <CANQCQpb1cH1k7NBDuRxfs=cKD4=0AgoS100yR7zxwSapnZyRzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Jul 17, 2018 at 3:06 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Mon, 16 Jul 2018 22:04:20 -0500, Matt Weber wrote:
>> Catch the commonly used options of SSP, Relro, and fortify.
>>
>> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>
> I'm a bit confused by this patch coming alone, outside of any series.
> Is it just because you had only changes to this PATCH 6/6 that you
> didn't resent the full series ?

Understood, yeah I should have asked on IRC today before sending.  I
already had reviewed by on the other patches so I hesitated resending
them as there wasn't change. Generally, can I add reviewed by's on
patches that don't change on a sending of a new version as long as the
patch didn't change?

>
> In general, my preference is that a full series gets resent, because it
> is obvious what your intention is. By just resending one patch, I
> wonder if you really sent that one patch, or if all patches were sent,
> but the previous ones were lost/not received for some reason.
>

Agree, it does make it confusing.  My intent was just to update this
one as the rest were in a good state without resending and had review.
Do you want me to resent the complete set?

Matt
