From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 24 Jan 2017 11:11:12 +0100
Subject: [Buildroot] [PATCH 1/8] python-pathvalidate: bump to version
	0.13.0
In-Reply-To: <20170124225845.18cc5e9d@free-electrons.com>
References: <20170117101725.19629-1-yegorslists@googlemail.com>
 <20170124225845.18cc5e9d@free-electrons.com>
Message-ID: <CAGm1_kuKwLm-+tuxHqF1WpiV3HRvsxiNteW5y3twB_K42evXMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 24, 2017 at 10:58 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 17 Jan 2017 11:17:18 +0100, yegorslists at googlemail.com wrote:
>> From: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> Add python-six to the runtime dependencies.
>>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>> ---
>>  package/python-pathvalidate/Config.in                | 1 +
>>  package/python-pathvalidate/python-pathvalidate.hash | 4 ++--
>>  package/python-pathvalidate/python-pathvalidate.mk   | 4 ++--
>>  3 files changed, 5 insertions(+), 4 deletions(-)
>
> Entire series applied, thanks!
>
> It's quite amazing that there are two Python packages (setuptools-scm
> and vcversioner) that essentially do exactly the same (at least, as far
> as I understood what they do). So many things to package for so little
> actual code :/

I was also surprised as I saw those two packages. It would be great if
setuptools would take care of that. Anyway we now have this
infrastructure.

Btw. the whole bunch of patches/packages was needed only to bump
pytablewriter :-)

I've submitted a licence file inclusion patch for vsversioner [1].
Hope the maintainer would find time to update his project.

[1] https://github.com/habnabit/vcversioner/pull/11

Yegor
