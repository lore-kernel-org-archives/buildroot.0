From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Feb 2012 18:29:28 +0100
Subject: [Buildroot] kernel boot problem
In-Reply-To: <CAAXf6LXL+1pkZTm56CUUkwmqkd0j9ozm6Yut8xhtGGC3qAVuHQ@mail.gmail.com>
References: <7E2C5DAB2B124E0C900A527EE0EF019C@JohanW7>
 <CAAXf6LXL+1pkZTm56CUUkwmqkd0j9ozm6Yut8xhtGGC3qAVuHQ@mail.gmail.com>
Message-ID: <201202071829.28255.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 07 February 2012 15:29:52 Thomas De Schampheleire wrote:
> Can you compare the versions of other packages used between both
> buildroot versions?
> For example, busybox probably changed version. Can you try stepping back that ?

 Since the panic happens before init starts, busybox is the only package 
whose version is relevant...

 However, the /init thing was added to the skeleton since 2010.02; that
may make a difference.  Johan, do you have /init on your target?  Is it
different between the two versions?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
