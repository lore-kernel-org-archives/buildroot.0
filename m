From: Will Newton <will.newton@gmail.com>
Date: Tue, 23 Jun 2009 13:02:45 +0100
Subject: [Buildroot] uClibc locale support
In-Reply-To: <20090623113919.GA22116@mx.loc>
References: <87a5b0800906230353o26db9cbegcd7ccbbe5cbd5b02@mail.gmail.com>
	<20090623113919.GA22116@mx.loc>
Message-ID: <87a5b0800906230502n44d6c3e0t56c543107e753536@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 23, 2009 at 12:39 PM, Bernhard
Reutner-Fischer<rep.dot.nop@gmail.com> wrote:
> On Tue, Jun 23, 2009 at 11:53:43AM +0100, Will Newton wrote:
>
>>Enable WCHAR support BR2_USE_WCHAR
>>
>>But the uClibc config selects UCLIBC_HAS_WCHAR if UCLIBC_HAS_LOCALE.is
>>selected, so surely this option should not be independent?
>
> It's perfectly fine to enable wchar support but not turn on this bloated
> locale stuff.

Certainly, but I am not sure if the inverse is true. So enabling
locale should select wchar support IMO.
