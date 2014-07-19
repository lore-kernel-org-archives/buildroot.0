From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 19 Jul 2014 22:28:12 +0200
Subject: [Buildroot] [PATCH 4/4] perl-gdgraph: new package
In-Reply-To: <20140719191051.358726f9@free-electrons.com>
References: <1405691019-10397-1-git-send-email-francois.perrad@gadz.org>
 <1405691019-10397-4-git-send-email-francois.perrad@gadz.org>
 <20140719191051.358726f9@free-electrons.com>
Message-ID: <CAB0FRssX48i-XJ6GuZFObfWZQwTGXEOyQhWFgtsswn9RoEuVqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-07-19 19:10 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Francois Perrad,
>
> On Fri, 18 Jul 2014 15:43:39 +0200, Francois Perrad wrote:
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  package/Config.in                    |  1 +
>>  package/perl-gdgraph/Config.in       | 12 ++++++++++++
>>  package/perl-gdgraph/perl-gdgraph.mk | 14 ++++++++++++++
>>  3 files changed, 27 insertions(+)
>>  create mode 100644 package/perl-gdgraph/Config.in
>>  create mode 100644 package/perl-gdgraph/perl-gdgraph.mk
>
> This package does not build:
>
>   http://autobuild.buildroot.org/results/3e1/3e1698b0523dfa46f5b3ee03a22af820f7342c39/build-end.log
>
> The error is:
>
> Warning: prerequisite GD 1.18 not found.
> Warning: prerequisite GD::Text 0.80 not found.
>

No, the error is :

   only nested arrays of non-refs are supported at
/usr/share/perl/5.10/ExtUtils/MakeMaker.pm line 664

And I could reproduce it on my box, with a host perl 5.10.1

Fran?ois

> Thanks,
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
