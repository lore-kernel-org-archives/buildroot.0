From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 20 Mar 2015 17:56:25 -0300
Subject: [Buildroot] [PATCH] glibc: disable eglibc 2.18 for sparc
In-Reply-To: <20150320215022.7df3b2f1@free-electrons.com>
References: <1426630860-2813-1-git-send-email-gustavo@zacarias.com.ar>
 <20150320215022.7df3b2f1@free-electrons.com>
Message-ID: <550C8979.9030803@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/20/2015 05:50 PM, Thomas Petazzoni wrote:

> Applied, but shouldn't we simply deprecated eglibc ? The latest eglibc
> release was 2.19, and glibc has already made two releases (2.20 and
> 2.21) since then.

Unfortunately eglibc 2.18 is the only (e)glibc that's good for powerpc
SPE at the moment (that does hard-float), so that would mean leaving
only uClibc for that scenario.
Regards.
