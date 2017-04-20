From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Apr 2017 13:14:31 +0200
Subject: [Buildroot] [PATCH 1/2] package: protobuf: bump to v3.2.0.
In-Reply-To: <CAKKQwLTqqp6wdTH5BtyJO9BX-WD+zCb-jWiOVZb2rhXF+hE=Pw@mail.gmail.com>
References: <20170417172225.20472-1-mrugiero@gmail.com>
 <b1c79629-4a22-a0a3-727d-7331e95bee0a@mind.be>
 <CAKKQwLRFmnDPHSBGo=xb=4y8p4j69BoJCxDSS5F1kSxGF_sdCQ@mail.gmail.com>
 <CAKKQwLTqqp6wdTH5BtyJO9BX-WD+zCb-jWiOVZb2rhXF+hE=Pw@mail.gmail.com>
Message-ID: <b28322c0-8a89-b103-e72e-922a7130fc68@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-04-17 06:41, Mario Rugiero wrote:
> Would it be OK to send the protobuf bump, version 2, and later send
> the gRPC patch? I believe the latter needs significant work, while I
> think I have a ready-to-review version of the protocol buffers' one.

 Most certainly. Version bumps generally get committed pretty quickly.

 Regards,
 Arnout

[PS Please don't top-post, but reply in-line like I just did.]

> 
> 2017-04-18 9:36 GMT-03:00 Mario Rugiero <mrugiero@gmail.com>:
>> Hi Arnout,
>> thanks for taking the time to review my patchset.
>> I build tested python-protobuf, so I already added that to the commit
>> message in my copy.
>> I don't see the patch applied, but it might build now with the changes
>> you mention, so I'm going to try building for PPC and SPARC without
>> the patch.
>> If it succeeds, I'll go ahead and remove the AUTORECONF step and the patch.
>> I'll get back to you soon.


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
