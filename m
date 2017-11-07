From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Nov 2017 14:31:57 +0100
Subject: [Buildroot] [PATCH v2] vboot-utils: fix ARCH detection
In-Reply-To: <20171107111938.GA445@latitude.localdomain>
References: <20171107101715.GA26991@latitude.localdomain>
 <20171107114037.3ac35009@windsurf>
 <20171107111938.GA445@latitude.localdomain>
Message-ID: <20171107143157.3b56af29@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 7 Nov 2017 13:19:38 +0200, Alex Suykov wrote:

> > Thanks for this new version. However, you still didn't reply to me
> > about what happens when HOST_ARCH != ARCH. The vboot-utils Makefile
> > seems to have some logic to use Qemu in that case. Do you understand
> > what it does exactly with Qemu, and that we won't have a problem by
> > having HOST_ARCH != ARCH ?  
> 
> Qemu is only used to run cross-compiled tests. Buildroot package
> neither builds nor runs tests, so it doesn't really matter whether
> qemu gets configured there or not.

OK, makes sense, thanks for the explanation. The patch is good to go!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
