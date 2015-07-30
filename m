From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 30 Jul 2015 23:28:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/libserial: bump to version
 0.6.0rc2
In-Reply-To: <20150730230054.3b0dd927@free-electrons.com>
References: <1438284088-20483-1-git-send-email-joerg.krause@embedded.rocks>
 <20150730230054.3b0dd927@free-electrons.com>
Message-ID: <1438291705.21638.12.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Do, 2015-07-30 at 23:00 +0200, Thomas Petazzoni wrote:
> Dear J?rg Krause,
> 
> On Thu, 30 Jul 2015 21:21:28 +0200, J?rg Krause wrote:
> 
> >   * add new dependency to boost
> 
> Woo, now to use a simple library to communicate over serial port, you
> need Boost. Open-source developers are crazy sometimes.

Seems boost::scoped_ptr is absolutely necessary :-)

> 
> >  	depends on BR2_INSTALL_LIBSTDCPP
> > +	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS # boost
> > +	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
> > +	depends on BR2_USE_WCHAR # boost
> > +	select boost
> 
> Really? I don't think this is the valid way to select boost :-)
> 

Oops!

J?rg
