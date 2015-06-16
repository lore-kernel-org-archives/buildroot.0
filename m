From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Jun 2015 23:15:48 +0200
Subject: [Buildroot] [PATCH] directfb: add an option for debugging
	support
In-Reply-To: <204a974adc4b86ce39264ea4c376f7c9@openmailbox.org>
References: <1434315067-19958-1-git-send-email-cedric.marie@openmailbox.org>
 <557DFB3B.6060701@mind.be> <204a974adc4b86ce39264ea4c376f7c9@openmailbox.org>
Message-ID: <55809204.9040708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/15/15 08:33, C?dric Marie wrote:
> Le 2015-06-15 00:07, Arnout Vandecappelle a ?crit :
>>  There should be a --enable-debug-support somewhere around here,
> 
> You're right, that would be safer. In case they change the default value.
> I will add it.
> 
> But I can't see any clear rule for that...
> --enable-multi, --enable-fusion, --enable-debug, --enable-trace have no disable
> counterpart.
> --enable-x11, --enable-unique, --enable-gif do have a --disable counterpart.
> 
> Moreover, there is a --disable-multi for host-directfb, while it is assumed to
> be the default for directfb (--enable-multi with no counterpart).


 Historical accident. Nowadays we try to enforce enable/disable pairs during review.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
