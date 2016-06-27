From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Jun 2016 22:56:16 +0200
Subject: [Buildroot] [PATCH] glibc: bump default to version 2.23
In-Reply-To: <8737nyqvp1.fsf@dell.be.48ers.dk>
References: <1466590187-21862-1-git-send-email-gustavo@zacarias.com.ar>
 <87r3bpwa02.fsf@dell.be.48ers.dk>
 <42d8119e5e64c7a67018770b3f029146@zacarias.com.ar>
 <20160622171317.79fbea7e@free-electrons.com>
 <312f3b85fab01ed234da9ff79ac982d0@zacarias.com.ar>
 <877fdhw8ek.fsf@dell.be.48ers.dk>
 <57d9d2a6-9bcc-c512-4e09-6eb8f8958c76@mind.be>
 <8737nyqvp1.fsf@dell.be.48ers.dk>
Message-ID: <b0eabfe2-047a-37ad-ff16-87db83e048b5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-06-16 21:27, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
[snip]
>  >  [*] I've checked if we could use another distro, but most are on glibc 2.19...
>  > Debian would be an option for glibc 2.22, but for 2.23 and 2.24 there will
>  > probably no viable distro.
> 
> Do you have any idea why these other distributions stick to those older
> versions?

 The ones I mention are of course LTS-style distro's. And understandably, an LTS
is not going to upgrade glibc, just backport patches.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
