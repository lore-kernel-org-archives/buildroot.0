From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Wed, 31 Aug 2016 07:26:31 +0000
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to
	arc-2016.09-eng010
In-Reply-To: <20160831091043.7e180877@free-electrons.com>
References: <1472579520-27726-1-git-send-email-vzakhar@synopsys.com>
 <878tvd1nii.fsf@dell.be.48ers.dk>, <20160831091043.7e180877@free-electrons.com>
Message-ID: <463012DA-8781-4E12-8D38-9C3BB7D95FF1@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, you are right.

In fact eng010 contains some patches that have been already added to buildroot and doesn't contain any fundamental changes, so  let's use eng010 for 2016.08.

Thanks.

Best regards,
Vlad Zakharov

> 31 ???. 2016 ?., ? 10:10, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ???????(?):
> 
> Hello,
> 
> On Wed, 31 Aug 2016 08:05:41 +0200, Peter Korsgaard wrote:
> 
>>> As described at:
>>> 4520524ba055706236db9f00dd79f1b2e2e87fde
>>> this commit continues a series of updates of ARC tools.
>>> This time we're updating tools to arc-2016.09-eng010.  
>> 
>>> This engenering build contains different fixes done to TLS and
>>> PIE features. Appropriate custom patches are removed as they have
>>> been added to eng010.  
>> 
>>> We still keep GDB as it is of arc-2016.03 release because there're some
>>> issues we'd like to resolve before releasing it to wider audience.  
>> 
>>> So again note this is next engineering builds of arc-2016.09 series
>>> and it might have all kinds of breakages, please don't use it for
>>> production builds.  
>> 
>> So what do we do for 2016.08 that we are just about to release?
>> 
>> Should I add it or should I wait until after the release?
> 
> I'm hesitating. You're going to release tonight, which doesn't leave a
> lot of time to test this. However, it's only affecting ARC, and we have
> an ARC internal toolchain configuration in the autobuilders, which will
> immediately start testing this.
> 
> In any case, we will have an "engineering" version of the ARC toolchain
> in the release, so whether is 009 or 010 doesn't matter much IMO.
> 
> So I'd say, let's commit :)
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
