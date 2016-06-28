From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 Jun 2016 01:03:18 +0200
Subject: [Buildroot] [PATCH 5/6] docs/manual/known-issues: remove
 occurrences of eglibc
In-Reply-To: <87d1n1jbvs.fsf@dell.be.48ers.dk>
References: <1465422059-22254-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1465422059-22254-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160613204653.GG3786@free.fr> <87d1n1jbvs.fsf@dell.be.48ers.dk>
Message-ID: <ef5036d6-a366-ba13-bcbb-8b3b2357a93c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28-06-16 22:29, Peter Korsgaard wrote:
>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
> Hi,
> 
>  > I just discovered we had a konwn-problems section in the manual... That
>  > worries me somewhat: it will be hard to ensure this stays current with
>  > the new versions of those packages...
> 
> Yeah, me too!
> 
>  > Are we sure those are still valid? For example. mrouted has been updated
>  > once since the known-issue was added; xfsprogs has been updated twice.
> 
> I don't know. Perhaps it would be better to have these notes closer to
> the package? Perhaps as comment lines in the Config.in or part of the
> help text?

 I'm in favour of the help text. It doesn't hurt to have relatively long help text.

 It's still not ideal because people will only consult help text for packages
they actively select, not for automatically selected packages. But there isn't
much we can do better than that. Or we'd have to add infra to print some "known
issue" text in case of build failure :-P

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
