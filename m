From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Aug 2018 14:08:43 +0200
Subject: [Buildroot] [PATCH] libsoup: security bump to version 2.62.3
In-Reply-To: <87mut6ybj5.fsf@tkos.co.il> (Baruch Siach's message of "Tue, 28
 Aug 2018 14:29:34 +0300")
References: <b3371f0ae3c4c91fc17182950ecaf97879d7da34.1535448446.git.baruch@tkos.co.il>
 <87zhx668nx.fsf@dell.be.48ers.dk> <87mut6ybj5.fsf@tkos.co.il>
Message-ID: <87va7u66d0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > Peter Korsgaard writes:

 >>>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
 >> 
 >> > Fixes CVE-2018-12910: The get_cookies function in soup-cookie-jar.c in
 >> > libsoup 2.63.2 allows attackers to have unspecified impact via an empty
 >> > hostname.
 >> 
 >> > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 >> 
 >> Thanks! I started looking at this myself, but got sidetracked.
 >> 
 >> Is 2.62.x the first release containing this fix? Should we also cherry
 >> pick this for 2018.02.x / 2018.05.x or is there a smaller patch that
 >> could be applied instead?

 > The upstream fix from the (stable) gnome-3-28 branch is:

 >   https://gitlab.gnome.org/GNOME/libsoup/commit/c5c41ad1d36c1efb3226a74ac8ea591419882892

 > You can cherry pick it to the gnome-3-22 branch that carries 2.56.x.

Thanks. Is that the best solution or does upgrading to 2.62.x look
"safe" for 2018.02 / 2018.05 / 2018.08?

-- 
Bye, Peter Korsgaard
