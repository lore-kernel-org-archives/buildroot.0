From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Mon, 29 Aug 2016 16:52:43 +0300
Subject: [Buildroot] [PATCH] [RFC] platform: update galileo to 3.14
 kernel
In-Reply-To: <bfd7fef5-f76a-723e-433c-955f28a991d8@intel.com>
References: <1471868735-13766-1-git-send-email-padraig.connolly@intel.com>
 <20160822163337.484cb311@free-electrons.com>
 <E704BB48EC9FDF4FA0A7A278C2546ACFE25B11@irsmsx105.ger.corp.intel.com>
 <20160823112531.13f75bab@free-electrons.com>
 <E704BB48EC9FDF4FA0A7A278C2546ACFE27080@irsmsx105.ger.corp.intel.com>
 <1472474898.4887.366.camel@linux.intel.com>
 <bfd7fef5-f76a-723e-433c-955f28a991d8@intel.com>
Message-ID: <1472478763.4887.373.camel@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2016-08-29 at 14:14 +0100, Kinsella, Ray wrote:
> Hi Andy,
> I have no idea if it goes to category "reasonable support", though
> > mention issue is applied to all similar boards (UP, Edison/Arduino,
> > ...).
> 
> I am afraid I don't understand.

I meant that all ACPI-enabled boards are starving of pin mapping
representation and thus pin muxing capability. There is neither standard
for that in ACPI, nor possibility to do pin muxing from user space at
run time.

I'm okay if you go for now with custom kernel, I hope situation will be
changed somehow towards using upstream kernels.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
