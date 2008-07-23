From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 23 Jul 2008 23:35:19 +1000
Subject: [Buildroot] Openssl won't compile
In-Reply-To: <4886A1F4.1010900@gnat.ca>
References: <4886A1F4.1010900@gnat.ca>
Message-ID: <20080723133519.GA27147@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 22, 2008 at 09:13:56PM -0600, Nathanael D. Noblet wrote:
> Hello,
>    Anyone experience difficulty compiling openssl (0.9.7m)? I get a 
> missing sys/timeb.h, upgrading to ssl 0.9.8g) is no better as the 
> patches don't apply and I'm not sure what the ones I couldn't fix were 
> doing.
> 
>    For what it is worth, I'm using gcc-3.1 and a daily snapshot of uclibc.

I'm not having any trouble building it for armeb with gcc 4.1.2 with
uClibc 0.9.29.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
