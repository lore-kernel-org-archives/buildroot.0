From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 06 Jan 2014 15:34:42 +0100
Subject: [Buildroot] [PATCH v2] Add LBreakout2 package (SDL game)
In-Reply-To: <1389009246-23441-1-git-send-email-julien.boibessot@free.fr>
 (julien boibessot's message of "Mon, 6 Jan 2014 12:54:06 +0100")
References: <1389009246-23441-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <87vbxxxjp9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "julien" == julien boibessot <julien.boibessot@free.fr> writes:

 > From: Julien Boibessot <julien.boibessot@armadeus.com>
 > Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
 > ---
 >  Changes since v1:
 >  - took Thomas remarks into account: SF dl, version, license and confiure
 >    options

It needs gettext when built with uclibc+locale. Committed with that
fixed, thanks.

-- 
Bye, Peter Korsgaard
