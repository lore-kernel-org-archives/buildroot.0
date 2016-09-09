From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Sep 2016 09:26:57 +0200
Subject: [Buildroot] [PATCH] package/mono: fix undefined reference to tls
In-Reply-To: <CA+TH9Vm4Q=XVaNBMk77MTx4bSscrm4DxEVk3ek2_dbVX64tg=A@mail.gmail.com>
References: <1473324667-31678-1-git-send-email-angelo.compagnucci@gmail.com>
 <20160908134257.55ca818c@free-electrons.com>
 <CA+TH9Vm4Q=XVaNBMk77MTx4bSscrm4DxEVk3ek2_dbVX64tg=A@mail.gmail.com>
Message-ID: <20160909092657.133b1e06@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 9 Sep 2016 07:29:11 +0200, Angelo Compagnucci wrote:

> I tested both the pre-compiled musl external toolchain and a musl internal
> toolchain I compiled and I can confirm that it's working without this patch.
> So, probably simply rebuilding the autobuild toolchain should solve the
> problem.

Excellent, thanks! I'll kick a rebuild of the different Buildroot
toolchains soon, especially since we have move to a newer binutils
version, and have more recent version of gcc available as well.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
