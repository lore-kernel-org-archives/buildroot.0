From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Wed, 13 Jul 2016 11:31:06 +0000
Subject: [Buildroot] [PATCH v2] toolchain: Bump ARC tools to
	arc-2016.09-eng006
In-Reply-To: <87r3ay5xhe.fsf@dell.be.48ers.dk>
References: <1468313301-30311-1-git-send-email-vzakhar@synopsys.com>
 <87r3ay5xhe.fsf@dell.be.48ers.dk>
Message-ID: <1468409466.29064.24.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 2016-07-12 at 23:59 +0200, Peter Korsgaard wrote:
> > 
> > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > "Vlad" == Vlad Zakharov <Vladislav.Zakharov@synopsys.com> writes:
> ?> As described at:
> ?> 4520524ba055706236db9f00dd79f1b2e2e87fde
> ?> this commit continues a series of updates of ARC tools.
> 
> ?> This engineering build fixes the kernel dwarf stack unwinder feature for
> ?> ARC targets.
> 
> ?> We still keep GDB as it is of arc-2016.03 release because there're some
> ?> issues we'd like to resolve before releasing it to wider audience.
> 
> ?> So again note this is next engineering builds of arc-2016.09 series
> ?> and it might have all kinds of breakages, please don't use it for
> ?> production builds.
> 
> ?> Related to:
> ?> 4520524ba055706236db9f00dd79f1b2e2e87fde
> 
> ?> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> 
> Committed, thanks.
> 

Could you please rebuild toolchain for ARC with this patch to keep us up to date with issues we have fixed and still have to fix?
Thanks.

-- 
Best regards,
Vlad Zakharov <vzakhar@synopsys.com>
