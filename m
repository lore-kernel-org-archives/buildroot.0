From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 23:51:53 +0200
Subject: [Buildroot] [PATCH v2] radlib: new package
In-Reply-To: <1459287337.10145.3.camel@intel.com>
References: <1459194027.3607.13.camel@intel.com>
 <20160329200702.01fc66d5@free-electrons.com>
 <1459287337.10145.3.camel@intel.com>
Message-ID: <20160329235153.21664d17@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Mar 2016 21:35:37 +0000, Kinsella, Ray wrote:
> > Please use git send-email to send your patches. Due to not using git
> > send-email, your e-mail is badly line-wrapped and cannot be applied,
> > and even less reviewed nicely.
> 
> ok - I will figure out the smtp setup. 

Plenty of @intel.com people contribute to the kernel, and use git
send-email. So I'm sure you can find the appropriate SMTP setup :)


> > This should go below the "---" sign.
> 
> ok the 'Delta's from v1:-' should be moved after the Signed-off-by
> line?

After the --- separator that follows the SoB line.

> > So you're doing three different things. Which calls for three
> > different
> > patches.
> 
> Hopefully this won't require me to re-org the patch. 

Well, you'll have to split your "big" patch into three smaller patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
