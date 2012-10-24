From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 24 Oct 2012 18:10:51 -0300
Subject: [Buildroot] [PATCH 12/12] arptables: add new package
In-Reply-To: <508856C6.1060504@mind.be>
References: <1350909989-1012-1-git-send-email-gustavo@zacarias.com.ar>
 <1350909989-1012-12-git-send-email-gustavo@zacarias.com.ar>
 <508856C6.1060504@mind.be>
Message-ID: <5088595B.1060803@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/24/12 17:59, Arnout Vandecappelle wrote:

>  We usually put
> ARPTABLES_VERSION_MAJOR = v0.0.3
> ARPTABLES_VERSION = $(ARPTABLES_VERSION_MAJOR)-4
> ARPTABLES_SITE
> =http://downloads.sourceforge.net/project/ebtables/arptables/arptables-$(ARPTABLES_VERSION_MAJOR)
> 
> 
> (_SITE is at its default value)
> 
>  I can't say if that's really better, though :-)
> 
>  Regards,
>  Arnout

In some cases it's also _MAJOR & _MINOR.
Dunno what's preferred, it seems overkill to use soo many zeros for very
few versions released :)
Regards.
