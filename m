From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 24 Sep 2018 13:11:26 +0200
Subject: [Buildroot] [PATCH] ffmpeg: fix static linking build failure
 when using libavutil
In-Reply-To: <20180924130929.4b345624@windsurf>
References: <20180911204230.15890-1-giulio.benetti@micronovasrl.com>
 <20180916222224.519fa1f8@windsurf>
 <63ee101c-ee45-57cc-4aeb-7f3b49753ccb@micronovasrl.com>
 <20180924130929.4b345624@windsurf>
Message-ID: <1b5dece6-8730-89d4-53dc-44f3492c49d9@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 24/09/2018 13:09, Thomas Petazzoni ha scritto:
> Hello,
> 
> On Mon, 24 Sep 2018 12:26:05 +0200, Giulio Benetti wrote:
> 
>>> Indeed, when we're dynamic linking, there is no need to link consumers
>>> of libavutil with libdrm. It is only when we're statically linking that
>>> it should be done. And that's exactly what Libs vs. Libs.private is for.
>>
>> You've explained me it very well, but by now FFmpeg upstreamed my patch:
>> https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/c50dc77ac708e98d02da7c422a6b9cbf9f565aa5
>>
>> So, do I rework and resubmit to them or can I re-create a patch for BR
>> with what you've pointed me above?
> 
> Both ? :-)

Ok!

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
