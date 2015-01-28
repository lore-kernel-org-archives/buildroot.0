From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Jan 2015 09:10:47 +0100
Subject: [Buildroot] [RFC 5/8] ccache: add custom help entries
In-Reply-To: <20150128055151.GP2555@sapphire.tkos.co.il>
References: <1422394913-13257-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1422394913-13257-6-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150128055151.GP2555@sapphire.tkos.co.il>
Message-ID: <20150128091047.4cae4bae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed, 28 Jan 2015 07:51:51 +0200, Baruch Siach wrote:

> On Tue, Jan 27, 2015 at 10:41:50PM +0100, Thomas Petazzoni wrote:
> [...]
> > +define HOST_CCACHE_PACKAGE_HELP
> > +	@$(call pkg-print-help-opt,ccache-stats,"Show ccache statistics")
> > +	@$(call pkg-print-help-opt,cache-options,"Update ccache options using CCACHE_OPTIONS variable")
> 
> s/cache-options/ccache-options/

Indeed, thanks for spotting, will fix in the next iteration if people
think the patch series is worthwhile.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
