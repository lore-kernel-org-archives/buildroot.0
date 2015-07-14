From: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
Date: Tue, 14 Jul 2015 12:57:21 -0300
Subject: [Buildroot] [PATCH v4 2/3] toolchain-external: add OSELAS
 2014.12.0 Cortex-M3 toolchain
In-Reply-To: <20150714154230.GC2332@tarshish>
References: <1435340002-20396-1-git-send-email-guido@vanguardiasur.com.ar>
 <1436886664-3206-1-git-send-email-guido@vanguardiasur.com.ar>
 <1436886664-3206-3-git-send-email-guido@vanguardiasur.com.ar>
 <20150714154230.GC2332@tarshish>
Message-ID: <20150714155721.GA8327@fox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 14, 2015 at 06:42:30PM +0300, Baruch Siach wrote:
> Hi Guido,
> 
> On Tue, Jul 14, 2015 at 12:11:03PM -0300, Guido Mart?nez wrote:
> > +config BR2_TOOLCHAIN_EXTERNAL_OSELAS_ARM_CORTEX_M3_201412
> > +	bool "OSELAS ARM Cortex-M3 2014.12"
> > +	depends on BR2_cortex_m3
> > +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> > +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
> > +	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
> > +	select BR2_LARGEFILE
> > +	select BR2_INET_IPV6
> 
> These two symbols were removed recently. All toolchains should now support LFS 
> and IPv6.
Ah, OK I missed that! Will remove those two.

-- 
Guido Mart?nez, VanguardiaSur
www.vanguardiasur.com.ar
