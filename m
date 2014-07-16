From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Jul 2014 00:32:25 +0200
Subject: [Buildroot] [PATCH] Add target-clean makefile target
In-Reply-To: <CA+TH9VnL390p2Pd61H087An6tSGJL_wQsZ=dsJXS5Q+vgLxKfw@mail.gmail.com>
References: <1403778551-31435-1-git-send-email-angelo.compagnucci@gmail.com>
 <20140715225415.08f5a5a6@free-electrons.com>
 <CA+TH9Vmp+-+Dgqh-BVR6-aUB3w5w_ccy0=3Mw_KMKciyRyD1rA@mail.gmail.com>
 <20140715233320.46a95f1a@free-electrons.com>
 <CA+TH9V=f4o7--R1T+o3o7aGJiJJ=6M2tSpsk1KGC=5Y=B5AHNQ@mail.gmail.com>
 <20140716100919.3f8101c3@free-electrons.com>
 <CA+TH9VnL390p2Pd61H087An6tSGJL_wQsZ=dsJXS5Q+vgLxKfw@mail.gmail.com>
Message-ID: <53C6FD79.1080200@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/07/14 10:29, Angelo Compagnucci wrote:
> Dear Thomas,
> 
> 2014-07-16 10:09 GMT+02:00 Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>:
>> Dear Angelo Compagnucci,
>>
>> On Wed, 16 Jul 2014 09:47:01 +0200, Angelo Compagnucci wrote:
>>
>>>> (7) is due to the fact that Git was not rebuilt, so it still believes
>>>> that OpenSSL support is available. The scenario above is fairly simple,
>>>> but there are many, many more similar but more subtle scenarios to
>>>> screw things up.
>>>
>>> Good catch, but this could be documented somewhere.
>>
>> Right, but then a patch adding "make target-clean" should also be
>> responsible for adding the appropriate documentation :-)
> 
> If there is hope to have target-clean accepted, then I'll be working
> on the documentation as soon as possible!

 I'd suggest to print a big fat warning at the end of target-clean. If it's
buried somewhere in the manual, chances are it will be missed.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
