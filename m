From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Oct 2014 18:02:53 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-10-22
In-Reply-To: <20141023180141.2515ed1c@free-electrons.com>
References: <20141023063017.0B8391011FF@stock.ovh.net>	<20141023082416.GG2220@tarshish>	<20141023140156.0e6bbc8b@free-electrons.com>	<54491A5C.6030802@mind.be>
 <20141023180141.2515ed1c@free-electrons.com>
Message-ID: <544926AD.3070102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/10/14 18:01, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Thu, 23 Oct 2014 17:10:20 +0200, Arnout Vandecappelle wrote:
> 
>>> That is indeed a very good question. In some sense, having -Werror
>>> enabled when --enable-debug is passed is quite legitimate.
>>
>>  No, I disagree with that. --enable-debug should be an option to enable anything
>> that makes runtime debugging easier - sometimes it enables extra debugging
>> output for instance.  -Werror is something which is only really valid for
>> continuous integration.
> 
> So in other words, your suggestion is to patch the package so that it
> does *not* use -Werror even when --enable-debug is used, correct?

 Exactly.

 If the patch is supposed to be upstreamable, it should probably add a
--enable-werror option like e.g. libcurl has.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
