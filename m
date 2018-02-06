From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Feb 2018 14:42:23 +0100
Subject: [Buildroot] [PATCH v5 1/2] libkrb5: New package
In-Reply-To: <CAH=K+6=G1ON+qsq8Jw7drxsYFXpuAm6fnqSba0bETJLwN65fmQ@mail.gmail.com>
References: <1517593141-26017-1-git-send-email-nerv@dawncrow.de>
 <CAH=K+6krFtqB=hj-Fe+pC6LdHKeE-uLYaSKRuvhmoO6d1Y-=9g@mail.gmail.com>
 <CAH=K+6=G1ON+qsq8Jw7drxsYFXpuAm6fnqSba0bETJLwN65fmQ@mail.gmail.com>
Message-ID: <0c1f1d4f-ccc0-689e-315f-eb14a3d46cfd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-02-18 14:28, Sam Voss wrote:
> Andr?,
> 
> On Tue, Feb 6, 2018 at 2:07 PM, Sam Voss <sam.voss@rockwellcollins.com> wrote:
>> Andr?,
>>
> [snip]
>>> +LIBKRB5_VERSION = 1.16
>>> +LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/1.16
>>
>> Can the version number be taken out of the url, and instead use
>> $(LIBKRB5_VERSION) once again here?
> 
> I actually take this back. I went and checked and minor revisions are
> also stored in this folder, so that will not work.

 In such a case we usually have a _VERSION_MAJOR variable that is used in the
definition of _VERSION and _SITE.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
