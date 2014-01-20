From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 20 Jan 2014 21:43:58 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #5 (deadline
	January 19)
In-Reply-To: <OF2BF2EC5E.5C8C5827-ON86257C58.004A99B8-86257C58.004B936D@rockwellcollins.com>
References: <CAAXf6LVcK-fx059K=tetV=NY78amOHczPkbVxkO1pKAuvDCwtA@mail.gmail.com>
 <OF2BF2EC5E.5C8C5827-ON86257C58.004A99B8-86257C58.004B936D@rockwellcollins.com>
Message-ID: <CAAXf6LUYkWafR+QADP3Sp+H0NMD8Qk70pLHyP7y+Jqz6iWkmLg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

On Mon, Jan 6, 2014 at 2:45 PM, Matthew Weber
<mlweber1@rockwellcollins.com> wrote:
> Hi Thomas,
>
[..]
>
>> [1/2] new package: python-posix_ipc.
>> Matt Weber <rc.lsw.collaborate@gmail.com>
>> http://patchwork.ozlabs.org/patch/212498
>>
>> [2/2] new package: python-posix_ipc
>> Matt Weber <rc.lsw.collaborate@gmail.com>
>> http://patchwork.ozlabs.org/patch/212499
>
> Still need this one.  I'll get is updated with the new python pkg hooks
> and submit a v2.

Seems this has been included now, great!
I'm marking the v1's as superseded.

>
>>
>> [1/1] added python unicode selection to menu
>> Matt Weber <rc.lsw.collaborate@gmail.com>
>> http://patchwork.ozlabs.org/patch/212500
>>
>
> The default unicode mode of a python build is ucs4.  This patch adds the
> option to select ucs2 or 4 if the unicode mode is enabled.  I'll refresh
> this one and submit v2.
>

v2 has been submitted and is awaiting integration. I just reviewed it,
hopefully it can be integrated soon.

Thanks for your feedback and resubmissions!

Best regards,
Thomas
