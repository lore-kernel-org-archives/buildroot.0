From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 20 Sep 2007 11:11:36 +0200
Subject: [Buildroot] sysroot not anabled even when	BR2_GCC_VERSION_4_2_1
	is selected
In-Reply-To: <12792950.post@talk.nabble.com>
References: <12792950.post@talk.nabble.com>
Message-ID: <20070920091136.GA27699@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 20, 2007 at 01:28:04AM -0700, Hebbar wrote:
>
>Hi All,
>
> I just tried latest buildroot snapshot and below is my buildroot config.
>What i observed is that BR2_TOOLCHAIN_SYSROOT i snot selected even though i
>have enabled gcc 4.2.1. Let me know if any one has a quickest solution. LEt
>me know if anyone needs more info.

I just noticed that too. Sounds like i broke that yesterday, will fix
ASAP.
