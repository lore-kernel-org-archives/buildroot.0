From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 11:23:49 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-07-02
In-Reply-To: <CAMRc=MfAxe99whmHQuBmBiWB7=mMjZEsZ6igT9XcsoQ9kXrkwg@mail.gmail.com>
References: <20170703063103.B69DB21E07@mail.free-electrons.com>
 <CAMRc=MfAxe99whmHQuBmBiWB7=mMjZEsZ6igT9XcsoQ9kXrkwg@mail.gmail.com>
Message-ID: <20170704112349.3de1d628@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 4 Jul 2017 11:10:02 +0200, Bartosz Golaszewski wrote:

> these failures are caused by missing the dynamic loader functionality
> in this pre-built toolchain. Should we maybe have a new config option
> like BR2_TOOLCHAIN_HAS_DL or something similar and depend on it from
> packages that need it?

Use "depends on !BR2_STATIC_LIBS", it's exactly meant for that.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
