From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 22:54:57 +0100
Subject: [Buildroot] [PATCH v3 3/8] postgresql: enable bfin compile
In-Reply-To: <trinity-4d99cda4-12a7-4ccd-a2d9-648264125705-1426625148665@3capp-gmx-bs04>
References: <trinity-4d99cda4-12a7-4ccd-a2d9-648264125705-1426625148665@3capp-gmx-bs04>
Message-ID: <20150317225457.5625e376@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Tue, 17 Mar 2015 21:45:48 +0100, Peter Seiderer wrote:

> ...should have added 'until Blackfin compile is disabled because of noMMU' as a footnote ;-)
> 
> But the remaining question: Revert the patch? Should I send a revert-patch?
> Or can you revert/commit directly? Or leave as is?

Well, please send a patch that adds the BR2_USE_MMU dependency, and as
part of it, removes the attempts at supporting Blackfin.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
