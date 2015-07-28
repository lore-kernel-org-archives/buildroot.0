From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 16:05:08 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-07-27
In-Reply-To: <1438092036.1610.2.camel@embedded.rocks>
References: <20150728063018.ECCE8101BC0@stock.ovh.net>
 <20150728105715.22962d48@free-electrons.com>
 <1438092036.1610.2.camel@embedded.rocks>
Message-ID: <20150728160508.5475ef5d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Tue, 28 Jul 2015 16:00:36 +0200, J?rg Krause wrote:

> > J?rg, you have touched Boost/cc-tool recently, can you have a look?
> 
> The old version of boost.m4 currently included in cc-tool has an issue
> with gcc5 (one of its tests fails due to the first change described in 
> https://gcc.gnu.org/gcc-5/porting_to.html , "Preprocessor issues").
> 
> This was fixed upstream in Nov 2014:
> 
> https://github.com/tsuna/boost.m4/commit/32553aaf4d5090da19aa0ec33b9369
> 82c685009f
> 
> I'll update boost.m4 for cc-tool and submit a patch.

Thanks! Can you also raise the issue to upstream cc-tool, so that it
gets fixed there as well?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
