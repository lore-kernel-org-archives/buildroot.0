From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 10 Mar 2015 11:25:03 +0000
Subject: [Buildroot] [PATCH v3] toolchain-external: add Synopsys
 DesignWare tools for ARC cores
In-Reply-To: <20150310121551.6cfefde4@free-electrons.com>
References: <1425985279-6965-1-git-send-email-abrodkin@synopsys.com>
 <20150310121551.6cfefde4@free-electrons.com>
Message-ID: <1425986702.4321.2.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2015-03-10 at 12:15 +0100, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Tue, 10 Mar 2015 14:01:19 +0300, Alexey Brodkin wrote:
> 
> > In v3 as proposed by Thomas I combined selection of toolchain source in one
> > section called BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12.
> 
> Thanks. However, what about the external toolchain wrapper change that
> is needed to pass -EB ? See my review of your v2.

Oops. I missed that part. Sorry.
v4 is coming :)

-Alexey
