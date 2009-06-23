From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 23 Jun 2009 13:39:20 +0200
Subject: [Buildroot] uClibc locale support
In-Reply-To: <87a5b0800906230353o26db9cbegcd7ccbbe5cbd5b02@mail.gmail.com>
References: <87a5b0800906230353o26db9cbegcd7ccbbe5cbd5b02@mail.gmail.com>
Message-ID: <20090623113919.GA22116@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 23, 2009 at 11:53:43AM +0100, Will Newton wrote:

>Enable WCHAR support BR2_USE_WCHAR
>
>But the uClibc config selects UCLIBC_HAS_WCHAR if UCLIBC_HAS_LOCALE.is
>selected, so surely this option should not be independent?

It's perfectly fine to enable wchar support but not turn on this bloated
locale stuff.
