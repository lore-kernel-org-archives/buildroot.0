From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 19:09:30 -0300
Subject: [Buildroot] [PATCH 07/54] libevent: add license information
In-Reply-To: <20140624215954.GJ31767@free.fr>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
 <1403636160-11807-7-git-send-email-gustavo@zacarias.com.ar>
 <20140624214940.GF31767@free.fr> <53A9F385.9020703@zacarias.com.ar>
 <20140624215954.GJ31767@free.fr>
Message-ID: <53A9F71A.8030100@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/24/2014 06:59 PM, Yann E. MORIN wrote:

> To be sure we're looking at the same file:
>     https://github.com/libevent/libevent/blob/master/LICENSE
> 
> Look at lines 57:
>     The arc4module is available under the following, sometimes called
>     the "OpenBSD" license: [...]
> 
> And line 77:
>     The Windows timer code is based on code from libutp, which is
>     distributed under this license, sometimes called the "MIT" license.
> 
> Those two are properly separated from the others with a prominent line
> of '=', so to me it clearly indicates the above license does apply to
> neither arc4module nor the Windows timer code.
> 
> So, I stand by my comment. ;-)
> 
> Regards,
> Yann E. MORIN.

I'm using the tarball, but yeah it looks the same.
Pffft damn legal language.
I'll spin v2 too with _LICENSE = BSD-3c, OpenBSD
Regards.
