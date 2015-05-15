From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 May 2015 17:12:49 +0200
Subject: [Buildroot] [git commit] libcap-ng: cannot be built with nios2
 CS 2014.05 toolchain
In-Reply-To: <87d222c5gu.fsf@dell.be.48ers.dk>
References: <20150514230014.126BC7FADF@busybox.osuosl.org>
 <20150515153705.37f9e610@free-electrons.com>
 <87d222c5gu.fsf@dell.be.48ers.dk>
Message-ID: <20150515171249.481fad4b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Fri, 15 May 2015 15:53:21 +0200, Peter Korsgaard wrote:

>  > I think you should have probably excluded
>  > BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305 as well. I haven't
>  > tested, but it's pretty likely that it will also break with this
>  > toolchain.
> 
> Yes, possibly. I had a quick look at the autobuilder failures and didn't
> see any with the 2013 version, but I can do a test build.

The autobuilders are only testing the 2014 version.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
