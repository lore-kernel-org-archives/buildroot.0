From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Mar 2021 21:52:07 +0100
Subject: [Buildroot] [PATCH] package/runc: cleanup the CPE_ID variables
In-Reply-To: <20210306215027.2421773-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 6 Mar 2021 22:50:27 +0100")
References: <20210306215027.2421773-1-yann.morin.1998@free.fr>
Message-ID: <875z1mvpc8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The CPE variables are derived from the package upstream values, so they
 > must be set from the package values, not the other way around.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Cc: Christian Stewart <christian@paral.in>

Not really a fix, but safe and it probably makes it easier to backport
fixes in the future, so committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
