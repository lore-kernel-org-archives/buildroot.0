From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 12 Feb 2014 10:41:52 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140212093245.49e2b6ac@skate>
References: <20140212073007.B3242100CEB@stock.ovh.net>
 <20140212093245.49e2b6ac@skate>
Message-ID: <CAAXf6LXjfkZ=3_fFPowo3k2HHyUkSpiHnOfGG=HS=0icjYBXhA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Feb 12, 2014 at 9:32 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
[..]
>
>>       bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/7069e1f43cbed745d65f7dd9904a3fff034530ac/
>
> Fixed by http://patchwork.ozlabs.org/patch/293833/. I'll try to give a
> test to this patch today, and send my tested by.
>

I'm assuming this will also fix bug #5768:
https://bugs.busybox.net/show_bug.cgi?id=5768
"Not able to build ALSA-Lib for static build"

Note that there is a related bug:
https://bugs.busybox.net/show_bug.cgi?id=5774
Not able to build ALSA-Utils for static build

which does not yet have a patch it seems. I tried reproducing it but
couldn't, but then again, the bug report does not really provide a lot
of info about the configuration.

Best regards,
thomas
