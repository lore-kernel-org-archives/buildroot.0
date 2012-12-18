From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Dec 2012 18:40:23 +0100
Subject: [Buildroot] [PATCH] linux: add option to get sources from
 custom directory
In-Reply-To: <20121212101407.GA9848@mail.sceen.net>
References: <1354873604-4304-1-git-send-email-rbraun@sceen.net>
 <20121212105418.601702fc@skate> <20121212101407.GA9848@mail.sceen.net>
Message-ID: <50D0AA87.7010404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/12/12 11:14, Richard Braun wrote:
> On Wed, Dec 12, 2012 at 10:54:18AM +0100, Thomas Petazzoni wrote:
>> On the other side, Linux, and bootloaders, are kind of special packages
>> in that very often people will have to work on them, and making this
>> easier might be useful.
>
> The fact that the kernel is clearly separate from the other packages in
> menuconfig, and that it already provides several ways of fetching the
> source makes it hard for most people to think of the override mechanism.
> On the other hand, the fact that it's handled almost like any other
> package makes this hack extremely easy and safe to implement. I don't
> see a reason not to provide this fetching method if the others aren't
> also reconsidered (otherwise I wouldn't have bothered sending it
> anyway).

  I agree. I think that if we provide several methods of downloading in 
the menuconfig, then all SITE_METHODs should ideally be supported. In 
particular svn is probably also of interest to some people.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
