From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2016 21:58:02 +0100
Subject: [Buildroot] [PATCH 1/3] vala: add vala/valac wrapper
In-Reply-To: <56CCB670.5000202@mind.be>
References: <1454428908-7183-1-git-send-email-gustavo@zacarias.com.ar>
 <20160221222816.4e53e921@free-electrons.com>
 <56CA62D8.10309@zacarias.com.ar> <56CB9DFA.506@mind.be>
 <56CBA547.3020200@zacarias.com.ar> <56CBAA86.4070305@mind.be>
 <56CBB0B1.6020506@zacarias.com.ar> <56CC2980.1020402@mind.be>
 <20160223104816.20c97306@free-electrons.com>
 <56CCB670.5000202@mind.be>
Message-ID: <20160223215802.5f8348da@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Tue, 23 Feb 2016 20:43:44 +0100, Arnout Vandecappelle wrote:

> > So what *really* saves time is people reviewing and testing patches. Of
> > course, the more "trusted" those persons are, the more valuable this
> > effort is. Gustavo, you're a person with a high trust, but
> > unfortunately, you're doing none of this review/testing effort.
> 
>  There is one indirect gain, however. In case something needs to be fixed up
> (not quite the majority but still a significant subset of the patches), then
> Yann and I currently just give comments and wait for a v2 of the patch. This
> often leads to several iterations. Fixing the patch right away and pushing it
> will take less time.

This is true. One quick and simple workaround to this issue is that
when you are in such a situation, just pick-up the patch and resend it
for your minor fixes.

Of course, if the minor fix is really super trivial, then just indicate
it in your review, and Peter and I can fix that up. But if the
requested changes are a bit more significant, it does make sense to
resend the patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
