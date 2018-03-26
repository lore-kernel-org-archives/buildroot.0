From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Mar 2018 13:55:34 +0200
Subject: [Buildroot] [PATCH] configs/freescale_p1025twr: needs
 host-openssl for the Linux kernel build
In-Reply-To: <20180325212036.06226774@windsurf>
References: <20180324142602.10995-1-thomas.petazzoni@bootlin.com>
 <CANQCQpZz5R1MkBEe2fxr9EsrTzsrzS55WPwbiTDq8W-wJS9snw@mail.gmail.com>
 <20180325212036.06226774@windsurf>
Message-ID: <a263d2ff-b184-e199-629c-e523ba026a02@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-03-18 21:20, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 24 Mar 2018 20:15:33 -0500, Matthew Weber wrote:
> 
>>> Fixes:
>>>
>>>   https://gitlab.com/buildroot.org/buildroot/-/jobs/59015355
>>
>> Sorry, I didn't realize this failed.  Is there an automated email on
>> this sort of failure?
> 
> No, there isn't. Unfortunately, the Gitlab CI infra is not very
> reliable, and a number of failures are not related to real problems in
> Buildroot, but to Gitlab CI infrastructure problems.

 Well, to be completely fair, it's not really the Gitlab CI infra which is
unreliable. Rather, it's the free runners that are unreliable. I expect that if
we would have a dedicated runner, we wouldn't see these problems. At least,
that's how it looks to me (I'm not really an expert though).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
