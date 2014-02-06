From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 06 Feb 2014 22:21:03 +0100
Subject: [Buildroot] autobuild.buildroot.org site improvement
In-Reply-To: <20140206215835.537252b7@skate>
References: <20140206215835.537252b7@skate>
Message-ID: <52F3FCBF.10301@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/02/14 21:58, Thomas Petazzoni wrote:
> Hello,
> 
> It was requested during the Buildroot meeting, and Ryan reminded me
> about it right now, so I took five minutes to implement it: filtering
> of autobuilder results by failed package.
> 
> See:
> 
>   http://autobuild.buildroot.org/?reason=vlc-2.1.2

 Nice!

 Small remark: the Next> link is wrong. And the total as well.


 Regards,
 Arnout

> 
> It only shows failures, because the autobuilder is not able to find out
> whether vlc-2.1.2 was built successfully as part of other builds. We
> could do this only if the user provides the corresponding Kconfig
> option.
> 
> Best regards,
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
