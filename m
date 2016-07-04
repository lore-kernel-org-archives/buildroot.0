From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Mon, 04 Jul 2016 17:04:43 +0300
Subject: [Buildroot] [PATCH v2 1/1] acpica: new package
In-Reply-To: <CAK4VdL0dXyheLx2LJusbfdJRD+3yYuEi7-E-cGruvB1178tKVg@mail.gmail.com>
References: <20160703104535.10401-1-nunes.erico@gmail.com>		
 <abb8c8a9-0bca-a441-b2bf-2c5f419e0d72@gmail.com>
 <CAK4VdL0dXyheLx2LJusbfdJRD+3yYuEi7-E-cGruvB1178tKVg@mail.gmail.com>
Message-ID: <1467641083.30123.470.camel@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2016-07-04 at 15:45 +0200, Erico Nunes wrote:
> Hello,
>?
> It contains tools such as acpidump, iasl, acpixtract, etc.
> > 
> > Thank you for doing this!
> > Though in our case we need this as a host tool. Can you add support
> > into
> > next version of the patch?
> 
> Hi Andy.
> 
> Thank you for the feedback!
> I think, though, that we would need to have some other target
> Buildroot target package depending on a host version of this one, in
> order to have it accepted with a host version. Otherwise it is an
> orphan host package. Or do we have a strong reason to have it enabled
> as a host package of its own (maybe adding a Config.in.host in this
> case)?
>?

We would like to add our ASL excerpts to initrd image which requires at
least iasl to be present on host side. We are developing the way how to
provide ASL excerpts for open connected boards such as Intel Galileo or
Minnowboard MAX.

-- 

Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
