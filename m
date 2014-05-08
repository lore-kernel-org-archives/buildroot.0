From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 09 May 2014 00:28:24 +0200
Subject: [Buildroot] [PATCH] infra: indent the Config.in source-ing of
 packages
In-Reply-To: <20140508222500.GA18030@free.fr>
References: <1399584943-26869-1-git-send-email-arnout@mind.be>
 <20140508222500.GA18030@free.fr>
Message-ID: <536C0508.5040905@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/05/14 00:25, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2014-05-08 23:35 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
>> This makes sure that a patch adding a package shows in which menu the
>> package is added.
> 
> I thought we said we should split the big Config.in into smaller,
> topic-related Config.in.TOPIC.
> 
> See this report from the Developpers' Day 2013:
>     http://elinux.org/Buildroot:DeveloperDaysFOSDEM2013
> 
> (Jumping in, as I was jsut thinking of doing that "one of those days"...)

 I know, I probably should have referred to that.

 This solution is much simpler, less invasive, less dangerous, and gives almost
the same result. This one I could do in a couple of minutes, while I never got
around to splitting the file (just like you).


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
