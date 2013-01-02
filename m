From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 02 Jan 2013 15:54:32 -0300
Subject: [Buildroot] [PATCH 10/20] xdriver_xf86-video-s3: remove package
In-Reply-To: <20130102175740.359fc5ce@skate>
References: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
 <44205c6a9db9d3496db982f686d29fe9d096a088.1357125961.git.thomas.petazzoni@free-electrons.com>
 <50E43558.2000003@petroprogram.com> <20130102175740.359fc5ce@skate>
Message-ID: <50E48268.401@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/02/2013 01:57 PM, Thomas Petazzoni wrote:

> Of course, I am curious to know if anybody is actually using one of
> these drivers, in which case we can postpone the removal.

All of the xf86-video-sun* drivers can be safely removed, even the cg6,
they're Sun workstation (SPARC) specific. And they're SBUS or UPA which
is a propietary Sun bus.
C&T, Rendition and Tseng haven't produced any video chip like for ages
now (10+ years). They don't even exist anymore.
For SiS (non-USB) i think i still got one ebox2300 (mini pc) that uses
one of those if it needs testing - though it was working last time i
tried with buildroot so no reason to think it broke.
Regards.
