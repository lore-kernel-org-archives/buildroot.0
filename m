From: Simon Dawson <spdawson@gmail.com>
Date: Wed, 21 Nov 2012 20:26:23 +0000
Subject: [Buildroot] [git commit] lcdproc: fix autobuilder failures
In-Reply-To: <20121121103357.53bef338@skate>
References: <20121115230738.33E869A031@busybox.osuosl.org>
 <20121116004452.635cf645@skate>
 <CAHt8ZCNQwhHyxiVy5pMtq5KJnYKS2RHm=0sOPp2VH5s7BePF3Q@mail.gmail.com>
 <20121116113343.15dd3eb3@skate>
 <CAG2jQ8gC5zotmF=Z2W4uu89VDxaHPpdJnf=L5Fes9xU6O2gXCQ@mail.gmail.com>
 <20121121103357.53bef338@skate>
Message-ID: <CAHt8ZCOq05Ss96mda3HuX0qOFNEdbq6_ZU5kJ+zPQQXFUxEHrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Markus, Thomas.

On 21 November 2012 09:33, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Markos Chandras,
>
> On Wed, 21 Nov 2012 09:23:11 +0000, Markos Chandras wrote:
>
>> I don't think is fixed. I am still getting this problem in master
>> branch and the autobuilder reports similar problems too.
>>
>> http://autobuild.buildroot.net/results/d7f51f07096a68ed5d513466ab3c1719a696cb19/build-end.log
>
> Indeed there is still a problem.
>
> Simon, do you have the time to look into this?

Unfortunately, I'm probably not going to get a chance to look at this
for a week or so. It's building correctly for me --- indeed, I don't
even see the problematic host include/library paths in the compiler
commands --- but clearly there is something wrong. I'll investigate as
soon as I can.

Simon.
