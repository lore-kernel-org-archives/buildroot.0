From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Aug 2012 00:22:58 +0200
Subject: [Buildroot] [PATCH] schifra: new package
In-Reply-To: <503B5167.2060501@lucaceresoli.net>
References: <1345801194-28735-1-git-send-email-spdawson@gmail.com>
 <20120825172140.4b4cdda7@skate> <503B5167.2060501@lucaceresoli.net>
Message-ID: <503BF342.8080507@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/27/12 12:52, Luca Ceresoli wrote:
> Thomas Petazzoni wrote:
>> Le Fri, 24 Aug 2012 10:39:54 +0100,
>> spdawson at gmail.com a ?crit :
>>
>>> +SCHIFRA_LICENSE = schifra license
>>> +SCHIFRA_LICENSE_FILES = schifra_license.txt
>>
>> Shouldn't we put something like "GPLv2 or commercial" here? Apparently,
>> their license is: GPLv2 is you do something open-source, otherwise if
>> you want to link in a proprietary application, you need to buy a
>> commercial license. I would at least like to have explicitly "GPLv2"
>> mentioned here as it would more clearly raise the attention of people
>> checking the license compatibility of the libraries they are using.
>>
>> Luca, thoughts?
>
> Disclaimer: I'd like remind everybody I'm not a lawyer. I implemented
> the legal-info feature in Buildroot, but do not consider my views about
> licensing as legal advice. These are only my interpretations of the
> various package licenses (which happen to be very fancy sometimes!).

  Same here.

>
> GPL licenses natively imply that you cannot use the code in a proprietary
> application (unless you obtain a license otherwise, of course). This used
> to be the case for Qt before Nokia released them under the LGPL. This is
> also the case of other libraries, such as eXosip:
> (http://git.savannah.gnu.org/cgit/exosip.git/tree/COPYING).
>
> But schifra has a more restrictive (and a bit ambiguous, IMHO) license.
> They grant a GPLv2 license only "within an open source, academic or other
> noncommercial/not-for-profit environment"
> (http://www.schifra.com/license.html).

  According to my reading, this means that somebody in an open source
environment (whatever that means) can use the library under the terms
of the GPLv2. And those terms stipulate that the user is allowed to
redistribute it under the terms of the GPLv2...

  So if you ask me, if we mirror it on sources.buildroot.net, it becomes
GPLv2.

[snip]
> Bottom line, how to encode all of this in SCHIFRA_LICENSE is a challenge.
> "GPLv2 only for open source, academic, noncommercial, not-for-profit" is
> not concise, but quite informative. "General Schifra License agreement",
> which is how they name it in schifra_license.txt, is the safest option,
> and an invitation to potential users to read such a convoluted piece of
> licensing literature and learn how not to license a package...

  Yup.  We want to indicate here that the legal team should pay special
attention, so 'Schifra license' is a good flag.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
