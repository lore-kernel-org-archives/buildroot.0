From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Jan 2014 07:30:31 +0100
Subject: [Buildroot] [PATCH] package: icu: detect and add compiler
 symbol prefix to the assembly code
In-Reply-To: <CAJxxZ0OOzpH-sT5WvywjiCEBQiHT4puZsa_tyV4ZAQgNytTLew@mail.gmail.com>
References: <1389006349-32377-1-git-send-email-Sonic.adi@gmail.com>
 <87y52iw7sv.fsf@dell.be.48ers.dk>
 <CAJxxZ0OOzpH-sT5WvywjiCEBQiHT4puZsa_tyV4ZAQgNytTLew@mail.gmail.com>
Message-ID: <52E5FD07.9020104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/01/14 10:18, Sonic Zhang wrote:
> Hi Peter,
>
> On Wed, Jan 15, 2014 at 5:52 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>>> "sonic" == sonic adi <sonic.adi@gmail.com> writes:
>>   > +--- icu-51.2/source/configure       2014-01-06 17:13:20.907249812 +0800
>>   > ++++ icu-51.2.bak/source/configure   2014-01-06 17:12:57.335248659 +0800
>>
>> Please adjust configure.ac and set ICU_AUTORECONF = YES instead.
>
> But, there is no configure.ac file in the icu source code.

  It is called configured.in in this package.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
