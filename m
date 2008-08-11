From: Steffen Schulz <pepe_ml@gmx.net>
Date: Mon, 11 Aug 2008 19:01:57 +0200
Subject: [Buildroot] New package util-linux-ng
In-Reply-To: <20080810050649.GA26515@cbg.dyndns.org>
References: <20080810050649.GA26515@cbg.dyndns.org>
Message-ID: <20080811170157.GA20864@cbg.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 080810 at 07:27, Steffen Schulz wrote:
> - util-linux still wants to compile even though it was not selected and
>   removed from Config.in
> - with util-linux-ng.mk, the are no errors, the package is simply ignored


Maybe I should have phrased that more like a question. I have a similar
problem now with a strongSwan package I need in buildroot.

I created a .mk that uses makefile.autotools.in. I select the new
packet in menuconfig and type make, but the package is simply ignored.
No errors.

If I use .mk files without Makefile.autotools.in, both packages are
correctly processed. Is there any magic thuss missing in my patch? I
also didn't find any cache files that could be responsible for this.

Using most recent svn trunks here.


Any help appreciated,
/Steffen
-- 
Hi, I'm a unix-virus.
Please copy me into your .signature to help me spread!
