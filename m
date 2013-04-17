From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 17 Apr 2013 07:46:01 +0200
Subject: [Buildroot] [PATCH] sam-ba: add license information
In-Reply-To: <CAHt8ZCM50Px59NfArH=xeOeGH1mvnmtN7tS8m01Euv5rQo87oQ@mail.gmail.com>
References: <1366010340-10833-1-git-send-email-spdawson@gmail.com>
 <20130415103252.26d79960@skate>
 <CAHt8ZCM50Px59NfArH=xeOeGH1mvnmtN7tS8m01Euv5rQo87oQ@mail.gmail.com>
Message-ID: <516E3719.3000502@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/04/13 10:40, Simon Dawson wrote:
> Hi Thomas, thanks for looking at this.
>
> On 15 April 2013 09:32, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>  wrote:
>> >Simon,
>> >
>> >On Mon, 15 Apr 2013 08:19:00 +0100,spdawson at gmail.com  wrote:
>> >
>>> >>+SAM_BA_LICENSE = BSD-like
>>> >>+SAM_BA_LICENSE_FILES = doc/readme.txt
>> >
>> >Hum, is this really the case? I thought the source code for it was not
>> >available? Well, it's true that a binary-only program can carry a BSD
>> >license... but to me, having 'BSD-like' license on a binary-only
>> >program sounds a bit odd.
> Yes, agreed. I'm not sure what the right approach is, given that
> sam-ba as distributed is a mixture of pre-built binaries, and (C and
> Tcl) source code. Perhaps we just say "sam-ba license", which may be
> less contentious...?

  I do like the "BSD-like" qualifier, though, because it tells you a lot 
more. How about "BSD-like (partly binary-only)"?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
