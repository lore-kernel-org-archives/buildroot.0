From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 3 Jul 2009 09:11:39 +0200
Subject: [Buildroot] uClibc, gcc get rebuilt on every make
In-Reply-To: <206b9e70907021637h666c10dco969f105de440f643@mail.gmail.com>
References: <0E8C14EA-CCA7-4F45-8E17-14321FFB4407@phidgets.com>
	<206b9e70907021338s137bdb6fw35e4f35bf38581e4@mail.gmail.com>
	<20090702210747.GE14135@mx.loc>
	<206b9e70907021637h666c10dco969f105de440f643@mail.gmail.com>
Message-ID: <20090703071139.GB25358@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 02, 2009 at 04:37:04PM -0700, Zac Wheeler wrote:
>On Thu, Jul 2, 2009 at 2:07 PM, Bernhard Reutner-Fischer <

>Cool, I didn't know about order-only prerequisites. Or are the additional CC
>and FLAGS options important for fixing this issue as well?

No, they are just a matter of correctness and a different issue.
