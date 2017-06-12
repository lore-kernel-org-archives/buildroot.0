From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 12 Jun 2017 13:22:54 -0700
Subject: [Buildroot] [PATCH v3 11/11] python-ipython: bump to version
	5.4.0
In-Reply-To: <20170611150709.170456dc@windsurf.home>
References: <20170602235653.4655-1-andrew.smirnov@gmail.com>
 <20170602235653.4655-12-andrew.smirnov@gmail.com>
 <CAGm1_kt8nV+XcG_55STn0xyHG+vNFk=OkSUDXf3VYnXAPZmHDQ@mail.gmail.com>
 <20170611150709.170456dc@windsurf.home>
Message-ID: <CAHQ1cqEmNPnAtQzuS4zUFj-ZSdAx8ChQTXiEQUL9+oXiykeUXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jun 11, 2017 at 6:07 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 9 Jun 2017 21:40:56 +0200, Yegor Yefremov wrote:
>> On Sat, Jun 3, 2017 at 1:56 AM, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>> > Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>>
>> you could squash this patch and the one with updated dependency list
>
> It depends. Is PATCH 10/11 (adding the dependencies) only needed for
> iPython 5.4.0, or also needed for the existing iPython 5.2.2. I think I
> remember having tested iPython 5.2.2, and those runtime dependencies
> were already necessary.
>
> If the runtime dependencies are already needed for iPython 5.2.2, then
> the patches should be kept separated.
>
> If the runtime dependencies are only needed because of the bump to
> 5.4.0, then patches should indeed been squashed together.
>

Those dependencies were needed for 5.2.2. I updated the package to
5.4.0 in the latest iteration of the patchset just because I noticed
BR was using older version and it was a trivial thing to do, so I
thought I might as well do it. I'll keep the patches separate.

Thanks,
Andrey Smirnov
