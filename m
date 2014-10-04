From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 4 Oct 2014 14:52:10 +0200
Subject: [Buildroot] [PATCH 1/3] perl: bump to version 5.20.1
In-Reply-To: <20141004142612.7d164eee@free-electrons.com>
References: <1412188619-3981-1-git-send-email-francois.perrad@gadz.org>
 <20141004142612.7d164eee@free-electrons.com>
Message-ID: <CAB0FRsvNwxtLpSH61AexhRG7_FKXqAOZwV9wPQ-uDA4i+OecRA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-10-04 14:26 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Francois Perrad,
>
> On Wed,  1 Oct 2014 20:36:57 +0200, Francois Perrad wrote:
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  package/perl/perl-uClibc-IPv6.patch | 10 +++++-----
>>  package/perl/perl.mk                | 11 +++++++----
>>  support/scripts/scancpan            |  2 +-
>>  3 files changed, 13 insertions(+), 10 deletions(-)
>
> Don't know if it's related to the version bump, but perl now fails to
> build on PowerPC:
>
>   http://autobuild.buildroot.org/results/8ad/8ade6c432ffa725a324f9e7cfb18f6453687b129/build-end.log
>
> Could you have a look?
>

I've already filled an issue, see https://github.com/arsv/perl-cross/issues/10

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
