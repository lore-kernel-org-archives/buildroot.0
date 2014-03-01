From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 20:57:35 +0100
Subject: [Buildroot] [PATCH 1/2] lvm2: add readline bump fix patch
In-Reply-To: <5312392A.10708@zacarias.com.ar>
References: <1393701664-7513-1-git-send-email-gustavo@zacarias.com.ar>
 <20140301204229.3d6dad4f@skate> <5312392A.10708@zacarias.com.ar>
Message-ID: <20140301205735.1ce79e0f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 01 Mar 2014 16:46:50 -0300, Gustavo Zacarias wrote:
> On 03/01/2014 04:42 PM, Thomas Petazzoni wrote:
> 
> > Dear Gustavo Zacarias,
> > 
> > On Sat,  1 Mar 2014 16:21:03 -0300, Gustavo Zacarias wrote:
> > 
> >> +The CPPFunction typedef (among others) have been deprecated in favour of
> > 
> > s/have/has/
> > 
> >> +specific prototyped typedefs since readline 4.2.
> >> +They've been working since because compatibility typedefs have been
> >> +until they were removed in readline 6.3.
> > 
> > I don't understand this last sentence. Is it my english that it too
> > limited, or because the sentence doesn't make sense? :-)
> > 
> > Same question for PATCH 2/2, which has the same issue.
> 
> Pff i'm still on vacation ;)
> AFAIK 'have' is valid since i'm talking of many though i'm focusing on
> just one in the patch.
> "They've been working" (the typedefs) "since" (the deprecation) "because
> compatibility typedefs have been" (+ in place... missing that) until
> they were removed in readline 6.3

May I request new patches that fix these minor issues?

Thanks :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
