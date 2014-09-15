From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 15 Sep 2014 10:48:53 -0400
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140915155934.7df3f86d@free-electrons.com>
References: <20140914063013.2E5D2100F07@stock.ovh.net>
 <20140914121904.0c2ebcbd@free-electrons.com>
 <CA+-urNSSKAn3=oXPM2553CO6+8XQB=4hKjzNR4mSg61aAY_LgQ@mail.gmail.com>
 <20140915155934.7df3f86d@free-electrons.com>
Message-ID: <CA+-urNRbKH8Yc8F8Sqa0iADAS8fxTskm98bNCw4xOYFP+AZR-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Sep 15, 2014 at 9:59 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Frank Hunleth,
>
> Please don't reply to me directly, keep the list in Cc. Thanks!

:) Ahh, I've been on too many "reply-to-list" mailing lists recently...

>
> On Mon, 15 Sep 2014 09:49:20 -0400, Frank Hunleth wrote:
>
>> > compiling qwt_plot_glcanvas.cpp
>> > In file included from qwt_plot_glcanvas.cpp:10:0:
>> > qwt_plot_glcanvas.h:15:17: fatal error: qgl.h: No such file or directory
>> > compilation terminated.
>> >
>> > Frank, you updated qwt recently. Could you have a look at this issue?
>>
>> I'll check this out later today or tomorrow. I have an idea on the issue.
>
> Note that the issue has already been fixed by Peter, see
> http://git.buildroot.net/buildroot/commit/?id=6de4afc3b4353327eb5a2dc57b9f449a4d14a969.
> Of course, you're welcome to check Peter's patch.

Great! I hadn't seen his patch, so thanks for pointing me to it

Frank
