From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 14 Apr 2016 10:03:28 +0200
Subject: [Buildroot] [PATCH v4] qt5webkit: restore package
In-Reply-To: <570EA9FE.4090709@mind.be>
References: <1460554835-5242-1-git-send-email-gary.bisson@boundarydevices.com>
 <20160413220646.102e7cd5@free-electrons.com>
 <570EA9FE.4090709@mind.be>
Message-ID: <CAAMH-yvJXNdVsV+=4tOir0d=YgfRrdTmSkV5xVAgrFwqr-igLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Arnout, All,

On Wed, Apr 13, 2016 at 10:20 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 04/13/16 22:06, Thomas Petazzoni wrote:
>>
>> Hello,
>>
>> Thanks. Looks mostly good, but I have a few questions.
>>
>> On Wed, 13 Apr 2016 15:40:35 +0200, Gary Bisson wrote:
>>
>>> Since we are now using the source from the git repository, we need
>>> to create an empty .git/ folder to force the headers re-generation.
>>>
>>> https://github.com/meta-qt5/meta-qt5/blob/jethro/recipes-qt/qt5/qt5.inc#L33
>>>
>>> Note that GPLv3 license option has been added with this release.
>>
>>
>> Yes, but I don't see any reference to GPLv3 in your license information
>> below.
>
>  Argh, licensing. A LICENSE.GPLv3 file has been added to the package.
> Clearly, whenever a package is licensed under LGPLv2+, you are allowed to
> redistribute it under GPLv3+. But I don't think that that's very relevant
> for us.

Yes I forgot to remove this comment, the LICENSE file for GPLv3 has
been added but that's about it.

>  However, when you look at the source files, all of them (except for a few
> build tools) are either LGPLv2 or BSD-3c or BSD-2c (a bunch of them are
> dual-licensed, but that's hardly relevant for the package as a whole because
> not all files are dual-licensed). Yes, indeed, the license file is for
> LGPLv2.1, but that doesn't correspond to the actual source code.
>
>  I threw it into the unomaha fossology a couple of days ago [1] so I'm
> pretty sure of my statement :-)
>
>  Hm, taking a second look, there are in fact a few dozen files that are
> LGPLv2.1+, so I guess indeed the concluded license should be LGPLv2.1+.

Ok, should I submit a v5 to fix it or will you make the change directly?

>  Regards,
>  Arnout
>
> [1]
> https://fossology.ist.unomaha.edu/?mod=license&upload=8&folder=1&item=107&show=quick

Didn't know that website, that's pretty useful, thanks!

Regards,
Gary
