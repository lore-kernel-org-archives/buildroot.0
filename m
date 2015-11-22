From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Sun, 22 Nov 2015 16:11:57 +0100
Subject: [Buildroot] [PATCH 2/3] package/gcc: comment on why we override
	the generic configure commands
In-Reply-To: <71e3b6c662031621f10fc3e1160ae1738204839b.1448202976.git.yann.morin.1998@free.fr>
References: <cover.1448202976.git.yann.morin.1998@free.fr>
 <71e3b6c662031621f10fc3e1160ae1738204839b.1448202976.git.yann.morin.1998@free.fr>
Message-ID: <1841581.bLZWfbY1R1@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 22 November 2015 15:39:42 Yann E. MORIN wrote:
> The explanations given in the commit log of 7d6c79 (Compile static
> versions of gcc libraries) do not explain why we have to provide
> custom configure commands, instead of just adding --enable-static to
> the configure options.
> 
> Add a comment in the code that explains why that is so. Add a pointer
> to the ML archives with the explanations, too.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: J?r?me Pouiller <jezz@sysmic.org>
Acked-by: J?r?me Pouiller <jezz@sysmic.org>


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
