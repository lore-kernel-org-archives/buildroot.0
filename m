From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 22:10:33 +0100
Subject: [Buildroot] [PATCH] glibc: disable eglibc 2.18 for sparc
In-Reply-To: <550C8979.9030803@zacarias.com.ar>
References: <1426630860-2813-1-git-send-email-gustavo@zacarias.com.ar>
 <20150320215022.7df3b2f1@free-electrons.com>
 <550C8979.9030803@zacarias.com.ar>
Message-ID: <20150320221033.13c88518@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 20 Mar 2015 17:56:25 -0300, Gustavo Zacarias wrote:

> > Applied, but shouldn't we simply deprecated eglibc ? The latest eglibc
> > release was 2.19, and glibc has already made two releases (2.20 and
> > 2.21) since then.
> 
> Unfortunately eglibc 2.18 is the only (e)glibc that's good for powerpc
> SPE at the moment (that does hard-float), so that would mean leaving
> only uClibc for that scenario.

Well if nobody cares about powerpc SPE in upstream glibc, using uClibc
will be the only solution.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
