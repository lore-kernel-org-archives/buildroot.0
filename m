From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jan 2014 07:59:35 +0100
Subject: [Buildroot] [PATCH] openssl: fix bug #6770
In-Reply-To: <52D4DDC2.9030904@mind.be>
References: <1389309614-17911-1-git-send-email-gustavo@zacarias.com.ar>
 <52D4DDC2.9030904@mind.be>
Message-ID: <20140126075935.6fa5db9f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 14 Jan 2014 07:48:34 +0100, Arnout Vandecappelle wrote:

>   It would be nice if the autobuilders would capture this issue. E.g.
> by enabling ccache 50% of the time (and clearing the cache every
> time, because we know it doesn't work correctly and because failures
> would be impossible to reproduce).

Indeed, this is part of my plans.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
