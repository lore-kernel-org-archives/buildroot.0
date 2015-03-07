From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 07 Mar 2015 02:02:20 +0100
Subject: [Buildroot] [PATCH 0/7] General LTTng packages maintenance
In-Reply-To: <20150306233246.11b83af2@free-electrons.com>
References: <1425663357-22541-1-git-send-email-eeppeliteloop@gmail.com>
 <20150306233246.11b83af2@free-electrons.com>
Message-ID: <54FA4E1C.9080909@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/03/15 23:32, Thomas Petazzoni wrote:
> Dear Philippe Proulx,
> 
> On Fri,  6 Mar 2015 12:35:50 -0500, Philippe Proulx wrote:
> 
>>   lttng-libust: rename package to lttng-ust
>>   lttng-babeltrace: rename package to babeltrace
> 
> To be honest, I am not sure about those ones. Renaming packages causes
> backward compatibility problems (that should be handled by adding the
> relevant entries in Config.in.legacy, which your patches is not doing),
> so renaming just for the sake of renaming, I'm not sure.

 For lttng-libust, I really think it's silly to rename it. Nobody will be
bothered by it.

 Babeltrace on the other hand is more defendable. Are there any other packages
that we carry that produces traces that can be read by babeltrace?

 Note also that there always has been pushback from Peter against gratuitous
renaming.

> 
> Since they lack the Config.in.legacy handling, I'll mark your patches
> as Changes Requested in our patch tracking system. When you'll resubmit
> them, I'll try to gather the opinion of other Buildroot developers to
> see what they think.

 Not only legacy handling, but also alphabetical ordering in package/Config.in.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
