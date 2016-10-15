From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 15 Oct 2016 23:14:40 +0200
Subject: [Buildroot] [ BUG ] Gzip shell configuration ?
In-Reply-To: <296b5618-884d-cb49-5cfb-ba74b05b1961@iktek.de>
References: <296b5618-884d-cb49-5cfb-ba74b05b1961@iktek.de>
Message-ID: <c0346003-8591-b241-4513-e3a648f6a582@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-10-16 15:05, Pascal Speck wrote:
> Dear List,
> 
> in my current Buildroot-Setup (2016.08) I'm experiencing the same problem as
> mentioned in:
> 
> http://lists.busybox.net/pipermail/buildroot/2015-September/139785.html
> 
> On my Buildsystem the gzip-1.8 Makefile is changing the /bin/sh in the scripts
> to /bin/bash as the $(SHELL) variable expands to /bin/bash, which is basically
> right...
> 
> Unfortunately I don't like to have bash on my target system. Is there a known
> fix for this?

 I just sent a patch, can you test it?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
