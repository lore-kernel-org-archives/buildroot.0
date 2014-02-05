From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 5 Feb 2014 20:46:46 +0100
Subject: [Buildroot] [pkg-perl infra V4 6/9] perl: remove useless patch
In-Reply-To: <20140205170309.3a7da08e@skate>
References: <1391608380-23240-1-git-send-email-francois.perrad@gadz.org>
 <1391608380-23240-7-git-send-email-francois.perrad@gadz.org>
 <20140205170309.3a7da08e@skate>
Message-ID: <CAB0FRss0MorGHCXKpq19nouNctZmUCRMQih7KnR3-Mf26GC0hw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-02-05 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Francois Perrad,
>
> On Wed,  5 Feb 2014 14:52:57 +0100, Francois Perrad wrote:
>>
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  package/perl/perl-fix-Module-Build.patch |   16 ----------------
>>  1 file changed, 16 deletions(-)
>>  delete mode 100644 package/perl/perl-fix-Module-Build.patch
>
> It would be good to indicate in the commit log why the patch was
> useless.
>

The Perl infrastructure uses a host version of Module-Build
(see previous commit "host-perl-module-build: new package").
The target version is never used.

Fran?ois

> Sorry to bother you so much about commit logs, but they are *really*
> important. I can't tell you the number of times I look at the git
> commit logs in the history of Buildroot to understand why such or such
> choice was made. So I really want to have good commit logs, and a
> commit log such as "remove useless patch" is not a good commit log, as
> it doesn't explain *why* the change was made.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
