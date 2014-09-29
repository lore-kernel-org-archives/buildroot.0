From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 29 Sep 2014 10:52:41 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-09-27
In-Reply-To: <20140928133642.GE3994@free.fr>
References: <20140928063011.030551009E8@stock.ovh.net>
 <20140928133642.GE3994@free.fr>
Message-ID: <54292BE9.5030105@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/28/2014 02:36 PM, Yann E. MORIN wrote:
>>       powerpc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/ad7ade4c436d21cba930f40c613870fbadec840e/
>
> Requires eventfd_{read,write}, not available on uClibc.
> I have a fix.

Dear Yann,

I sent a patch for this 5 days ago:

http://patchwork.ozlabs.org/patch/392966/

-- 
Vincent
