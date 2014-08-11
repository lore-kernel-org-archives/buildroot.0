From: Arnaud Aujon <arnaud@intelibre.fr>
Date: Mon, 11 Aug 2014 14:32:10 +0200
Subject: [Buildroot] [PATCH 1/1] espeak : depends on MMU
In-Reply-To: <87wqaf70bi.fsf@dell.be.48ers.dk>
References: <1407742731-5300-1-git-send-email-arnaud@intelibre.fr>	<d0d00ba2-2cf5-4f5a-945a-9f215d587e61@email.android.com>
 <87wqaf70bi.fsf@dell.be.48ers.dk>
Message-ID: <53E8B7CA.7090805@intelibre.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
On 08/11/2014 01:06 PM, Peter Korsgaard wrote:
>   >> http://espeak.sourceforge.net/
>   >>
>   >> +comment "espeak needs a toolchain w/ C++, wchar, threads"
>   >> +        depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
>   >> +        depends on BR2_USE_MMU
>   >> +
>
>   > While the moving of this comment seems to be the right thing to do, I believe this will break the indentation/nesting of the suboptions of espeak.
>
> Indeed. Comments should go at the very top or bottom of the file. Care
> to send a reworked patch that leaves the comment at the top?
>

Yes sure, I will re-send shortly.
I moved the comment to match the xbmc package Config.in, so I guess 
there is maybe a few other packages to fix the same way.
