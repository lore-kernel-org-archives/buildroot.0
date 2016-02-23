From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2016 10:48:16 +0100
Subject: [Buildroot] [PATCH 1/3] vala: add vala/valac wrapper
In-Reply-To: <56CC2980.1020402@mind.be>
References: <1454428908-7183-1-git-send-email-gustavo@zacarias.com.ar>
 <20160221222816.4e53e921@free-electrons.com>
 <56CA62D8.10309@zacarias.com.ar> <56CB9DFA.506@mind.be>
 <56CBA547.3020200@zacarias.com.ar> <56CBAA86.4070305@mind.be>
 <56CBB0B1.6020506@zacarias.com.ar> <56CC2980.1020402@mind.be>
Message-ID: <20160223104816.20c97306@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Feb 2016 10:42:24 +0100, Arnout Vandecappelle wrote:

>  This could indeed be a good idea. One reason to limit the number of committers
> was to avoid conflicts (i.e. two committers working on the same patch in
> parallel), but as I understand it, Thomas and Peter noticed that this isn't
> really a problem in practice.
> 
>  So indeed, having a third person that applies trivial patches could be
> worthwhile to try.
> 
>  That said, Yann and I are already spending a large part of our buildroot time
> on reviewing patches. I don't think that applying them immediately is going to
> make that much of a difference.

Fully agreed: applying the patch is clearly not what takes time. It's a
mechanical and stupid operation.

What takes time is that when there is no Acked-by/Reviewed-by/Tested-by
from a trusted person and the patch is not obviously trivial, then I
have to go review the patch myself entirely. Download the source code,
check that the license is correct, verify that optional dependencies
are properly handled, build in a few basic situations, etc. All those
steps I skip when there has been some previous A/R/T tags given by
trusted persons.

When I see that Arnout or Yann has started reviewing a specific patch
or patch series, I assume that they will continue to handle the
discussion with the submitter until they give their
Acked-by/Reviewed-by. And therefore, I simply skip that patch or patch
series, and move on to other topics.

So what *really* saves time is people reviewing and testing patches. Of
course, the more "trusted" those persons are, the more valuable this
effort is. Gustavo, you're a person with a high trust, but
unfortunately, you're doing none of this review/testing effort.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
