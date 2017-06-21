From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Jun 2017 22:28:09 +0200
Subject: [Buildroot] [PATCH] iperf: fix tarball hashes changed upstream
In-Reply-To: <87h8z9jt2g.fsf@dell.be.48ers.dk>
References: <1498018018-22680-1-git-send-email-post@lespocky.de>
 <87h8z9jt2g.fsf@dell.be.48ers.dk>
Message-ID: <2ff88708-7de6-7838-aaf7-9b3196eed376@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-06-17 16:47, Peter Korsgaard wrote:
>>>>>> "Alexander" == Alexander Dahl <post@lespocky.de> writes:
> 
>  > Upstream uploaded a new tarball with the same version number 2016-09-08,
>  > some time after the update to v2.0.9 in buildroot. Someone noticed, but
>  > upstream set the ticket to wontfix, and promised to do better in the
>  > future: https://sourceforge.net/p/iperf2/tickets/20/
> 
>  > Signed-off-by: Alexander Dahl <post@lespocky.de>
>  > ---
>  > According to y_morin on IRC you may want to change or remove the tarball
>  > on source.buildroot.org then.
> 
> FYI, I've updated the tarball on s.b.o.

 ... which means that anyone using Buildroot 2.0.9 cannot use iperf... I think
you should restore the old tarball until 2017.05.1 is released.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
