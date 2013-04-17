From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 17 Apr 2013 18:04:27 +0200
Subject: [Buildroot] [PATCH] monit: add license information
In-Reply-To: <CAHt8ZCOAKON3x0ac35oWttaUcvoAv2GQm_yMwNjaDaA1G3D4_A@mail.gmail.com>
References: <1366011607-31433-1-git-send-email-spdawson@gmail.com>
 <87eheblas9.fsf@dell.be.48ers.dk>
 <CAHt8ZCOAKON3x0ac35oWttaUcvoAv2GQm_yMwNjaDaA1G3D4_A@mail.gmail.com>
Message-ID: <516EC80B.9040101@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/04/13 15:48, Simon Dawson wrote:
> Hi Peter; thanks for looking at this.
>
> On 15 April 2013 22:54, Peter Korsgaard <jacmet@uclibc.org> wrote:
>> Hmm, I see very few files mentioning the 'any later version':
>
> Yes, okay; it should be AGPLv3.
>
>> src/monit.c also talks about a special openssl exception.
>>
>> How should we handle this?
>
> Awkward. I wonder if it's simply a case of saying
>
> MONIT_LICENSE = AGPLv3 OpenSSL

  We usually say "AGPLv3 with exceptions". Since it's one pretty well 
defined exception here, we could make it "AGPLv3 with OpenSSL exception".

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
