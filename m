From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Oct 2013 13:36:30 +0200
Subject: [Buildroot] [PATCH 0/4] i.MX: Refactor and update library
	versions
In-Reply-To: <524F4541.1090004@boundarydevices.com>
References: <1380495298-22823-1-git-send-email-eric.nelson@boundarydevices.com>
 <524F4541.1090004@boundarydevices.com>
Message-ID: <20131005133630.7f799fd6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Nelson,

On Fri, 04 Oct 2013 15:46:25 -0700, Eric Nelson wrote:

> On 09/29/2013 03:54 PM, Eric Nelson wrote:
> > This patch set restructures several libraries to share common
> > Makefile fragments in package/freescale-imx and bumps the
> > library versions to match the Freescale 3.0.35_4.1.0 release
> > for i.MX6.
> >
> 
> Thomas and Arnout: do you want these to stay in /package?

I don't have a strong opinion on this one. If they use the
FREESCALE_IMX_MIRROR / FREESCALE_IMX_VERSION variable, I would find it
more logical to have them under package/freescale-imx/, but it's really
not a strong requirement.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
