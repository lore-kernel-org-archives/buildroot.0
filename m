From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 21 Nov 2016 22:01:42 +0100
Subject: [Buildroot] [PATCH 4/4] qextserialport: fix static build
In-Reply-To: <20161121220032.18cf159d@free-electrons.com>
References: <20161120221329.5827-1-arnout@mind.be>
 <20161120221329.5827-4-arnout@mind.be>
 <20161121214125.2bb92b98@free-electrons.com>
 <9e55426c-e90e-6b11-752c-adba35813e23@mind.be>
 <20161121220032.18cf159d@free-electrons.com>
Message-ID: <94c670a5-7279-13f8-fec4-98ca921007c5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-11-16 22:00, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 21 Nov 2016 21:53:51 +0100, Arnout Vandecappelle wrote:
> 
>>> It's a bit annoying that this comes late in the series. Some of the
>>> rework in the previous patches are not technically needed to get this
>>> build fix, and with the way your patch series is organized, we have to
>>> merge more-or-less unrelated cleanups in master to get the build fix.  
>>
>>  Well, I considered patches 1 and 2 to be safe enough to be used even for
>> master. Just to give you the choice, I'll respin without patches 1 and 2 (but
>> without marking this series as superseded).
> 
> Yeah, it's true 1 and 2 are quite obvious, and 3 is really needed for
> the build fix. I guess I'll apply as-is, no need to respin.

 Okay. You'll fix up patch 3 to modify 0003-pkgconfig.patch as well?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
