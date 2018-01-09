From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 9 Jan 2018 14:03:01 +0000
Subject: [Buildroot] [PATCH] vlc: enable package on ARC
In-Reply-To: <20180101170713.54183634@windsurf>
References: <20171011125005.25545-1-didin@synopsys.com>
 <20180101170713.54183634@windsurf>
Message-ID: <1515506581.3868.9.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2018-01-01 at 17:07 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 11 Oct 2017 15:50:05 +0300, Evgeniy Didin wrote:
> > Now using arc-2017.09-rc1 toolchain it is possible to
> > build vlc package.
> > 
> > Note this patch has a prerequisite that updates ARC prebuilt toolchain,
> > https://urldefense.proofpoint.com/v2/url?u=http-3A__patchwork.ozlabs.org_patch_824311_&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViX
> > O7breS55ytWkhpk5R81I&m=oXjZ7iSe0ULSbamHCYCDrRMyfbYSj9WjWCPS6OHy66I&s=gnkVm--myTL2YUFtDvz5VfzEZVxwxwtbjnw4mMxXGJY&e=
> 
> I've applied this patch. However, we still haven't received a new
> version of the patch bumping the ARC external toolchain. Could you send
> such an update in the near future ?

I think with https://git.buildroot.net/buildroot/commit/toolchain/toolchain-external/toolchain-external-synopsys-arc?id=c208203618cfaf3e9dcbcc8c987f99
27999c53ff in place your request is resolved right?

-Alexey
