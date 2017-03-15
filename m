From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Mar 2017 21:56:44 +0100
Subject: [Buildroot] cmake is not building anymore
In-Reply-To: <1489608248.19767.11.camel@linux.intel.com> (Andy Shevchenko's
 message of "Wed, 15 Mar 2017 22:04:08 +0200")
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
Message-ID: <87lgs6qmwj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andy" == Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

Hi,

 >> ? rm -r output/build/host-cmake*
 >> ? make host-cmake
 >> 
 >> Does that work?

 > Yes, it does with `rm -rf` (I tried before with make host-cmake-clean-
 > for-reconfigutre, that didn't help)

Ok, that is good at least. So I guess the solution is to convince cmake
to build its embedded libarchive copy without openssl support, or to
move to system libraries and add host-libarchive to the dependencies.

-- 
Bye, Peter Korsgaard
