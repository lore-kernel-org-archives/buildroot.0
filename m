From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Nov 2013 13:31:06 +0100
Subject: [Buildroot] [PATCH 4/4] support/kconfig: bump to kconfig from
	linux-3.12
In-Reply-To: <87li0r1a7s.fsf@dell.be.48ers.dk>
References: <cover.1384386575.git.yann.morin.1998@free.fr>
 <eabc0ac6fc62b091a78c1f78a987fbe3962e0c95.1384386575.git.yann.morin.1998@free.fr>
 <87li0r1a7s.fsf@dell.be.48ers.dk>
Message-ID: <20131114133106.1a65c852@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Jeremy,

On Thu, 14 Nov 2013 12:41:59 +0100, Peter Korsgaard wrote:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > With this, we can trash our probability patch, it's now upstream.
>  > Refresh a few other patches.
> 
>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Thanks. Strangely enough pwclient doesn't like the patch:
> 
> pwclient get 291086
> Traceback (most recent call last):

BTW, another issue I had with pwclient is when the author name contains
non ASCII characters such as french accents. pwclient fails with  one
of the well-known Python exception regarding charset conversion
problems.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
