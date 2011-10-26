From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Oct 2011 11:28:45 +0200
Subject: [Buildroot] [PATCH] Allow build of dropbear without wtmp and
	lastlog support to stop it from generating system log error messages
In-Reply-To: <360A918D72F84824B9E2048CFEFBB053@beraninstruments.com.local>
 (Will Moore's message of "Tue, 25 Oct 2011 13:22:18 +0100")
References: <360A918D72F84824B9E2048CFEFBB053@beraninstruments.com.local>
Message-ID: <87bot4umnm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Moore <will.moore@beraninstruments.com> writes:

 Will> Buildroot does not have wtmp or lastlog support by default so
 Will> allow dropbear to be configured to stop using them and hence to
 Will> stop generating system log error messages.

Committed, thanks - I prefer positive options (E.G. to enable
wtmp/lastlog logging - And I disable them by default as that's what most
people would want).

 Will> It seems I had problems with git send-email sending direct to the
 Will> list (the patch failed to appear within a day) so I have
 Will> forwarded the copy it cc'ed to myself to the list...

Please keep these comment after the '---' line, otherwise it gets
included in the commit message.

-- 
Bye, Peter Korsgaard
