From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Mon, 20 Mar 2017 14:47:12 +0200
Subject: [Buildroot] cmake is not building anymore
In-Reply-To: <87lgs6qmwj.fsf@dell.be.48ers.dk>
References: <1489417019.20145.214.camel@linux.intel.com>
 <1489420484.20145.218.camel@linux.intel.com>
 <544671010.14659188.1489539751977.JavaMail.zimbra@datacom.ind.br>
 <1489590657.19767.1.camel@linux.intel.com>
 <372249453.14780914.1489593932103.JavaMail.zimbra@datacom.ind.br>
 <1489598613.19767.6.camel@linux.intel.com>
 <744747071.14828951.1489604108907.JavaMail.zimbra@datacom.ind.br>
 <1489607040.19767.9.camel@linux.intel.com>
 <20170315194910.d5bftkd7vtozqfid@tarshish>
 <1489608248.19767.11.camel@linux.intel.com>
 <87lgs6qmwj.fsf@dell.be.48ers.dk>
Message-ID: <1490014032.19767.99.camel@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2017-03-15 at 21:56 +0100, Peter Korsgaard wrote:
> > > > > > "Andy" == Andy Shevchenko <andriy.shevchenko@linux.intel.com
> > > > > > > writes:
> 
> Hi,
> 
> ?>> ? rm -r output/build/host-cmake*
> ?>> ? make host-cmake
> ?>>?
> ?>> Does that work?
> 
> ?> Yes, it does with `rm -rf` (I tried before with make host-cmake-
> clean-
> ?> for-reconfigutre, that didn't help)
> 
> Ok, that is good at least. So I guess the solution is to convince
> cmake
> to build its embedded libarchive copy without openssl support, or to
> move to system libraries and add host-libarchive to the dependencies.

So, is anyone going to fix it?

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
