From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 5 Dec 2016 23:03:10 +0100
Subject: [Buildroot] [PATCH 2/3] core: waf-package infra: add missing
 additional variables for each build step
In-Reply-To: <20161205222454.137bc43e@free-electrons.com>
References: <1480885126-517-1-git-send-email-romain.naour@gmail.com>
 <1480885126-517-2-git-send-email-romain.naour@gmail.com>
 <20161204212433.GC3433@free.fr> <20161204224100.26768191@free-electrons.com>
 <43f11483-2fa1-3191-b5b0-4ccbaad28903@mind.be>
 <f68f3eba-28f0-a3eb-23bc-4954fc05cbd0@gmail.com>
 <20161205222454.137bc43e@free-electrons.com>
Message-ID: <71688f2e-ccf0-216d-87a0-f808cd8eceea@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-12-16 22:24, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 5 Dec 2016 22:18:37 +0100, Romain Naour wrote:
> 
>> What's about <pkg>_WAF_OPTS ?
>> In case of aubio we don't really need to pass --notests for the configure step,
>> only for build and staging/target install step.
> 
> waf is used for all of the configure, build and install steps. So I
> would expect something called WAF_OPTS to be passed at all of these
> steps, not only at build/install time.

 Yeah, sounds the most consistent to me as well. Note that it means that it is
really different for all infras...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
