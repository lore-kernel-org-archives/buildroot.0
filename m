From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 13 Apr 2017 22:41:42 +0200
Subject: [Buildroot] [PATCH/autobuild v2 6/7] autobuild-run: simplify,
 don't make a dict of config
In-Reply-To: <20170412224259.2c201c0f@free-electrons.com>
References: <20170410220003.30421-1-arnout@mind.be>
 <20170410220003.30421-6-arnout@mind.be>
 <20170412224259.2c201c0f@free-electrons.com>
Message-ID: <2e130abb-f810-3470-3850-308bbc431565@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-04-17 22:42, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 11 Apr 2017 00:00:02 +0200, Arnout Vandecappelle
> (Essensium/Mind) wrote:
> 
>> -    configlines = config["contents"]
>> +    configlines = config
> 
> So, using directly the variable named "config" in the remainder of this
> function would be more logical, no?

 Indeed, it looks kind of ridiculous now...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
