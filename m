From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Dec 2009 21:34:12 +0100
Subject: [Buildroot] BR + CT-NG integration
In-Reply-To: <4B30BC14.3050207@zacarias.com.ar> (Gustavo Zacarias's message of
	"Tue, 22 Dec 2009 09:31:16 -0300")
References: <200912212351.11487.yann.morin.1998@anciens.enib.fr>
	<4B30BC14.3050207@zacarias.com.ar>
Message-ID: <87r5qmwxx7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Yann E. MORIN wrote:
 >> So, on the overall, it's not that bad. Crosstool-NG brings in four archs
 >> that buildroot has no support for, while it is missing five archs. For
 >> some archs, some work in CT-NG is still needed to support some variants.

 Gustavo> The CRIS architecture is somewhat going to vanish since Axis
 Gustavo> won't be selling/supporting the chips publically any
 Gustavo> longer. Peter might want to drop it soonish.  I also doubt
 Gustavo> it's in working order at the moment either.  For a precise
 Gustavo> timeline of Axis's plans you can see
 Gustavo> http://www.axis.com/products/dev/index.htm Regards.

We had cris patches submitted earlier this year, so I don't plan on
removing it right away.

-- 
Bye, Peter Korsgaard
