From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Apr 2019 23:10:41 +0200
Subject: [Buildroot] [PATCH 1/2] package/llvm: bump to 8.0.0
In-Reply-To: <20190407142611.19372-1-valentinkorenblit@gmail.com>
References: <20190407142611.19372-1-valentinkorenblit@gmail.com>
Message-ID: <20190408231041.28bc9408@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Valentin,

Thanks for this update. One comment below.

On Sun,  7 Apr 2019 16:26:10 +0200
Valentin Korenblit <valentinkorenblit@gmail.com> wrote:

> -sha256 a38dfc4db47102ec79dcc2aa61e93722c5f6f06f0a961073bd84b78fb949419b llvm-7.0.1.src.tar.xz
> -sha256 0303dfeaac87b80d2d1e543aa38d5be77b0eac93c3d04fe7e3c8eaa71a778667 LICENSE.TXT
> +sha256 8872be1b12c61450cacc82b3d153eab02be2546ef34fa3580ed14137bb26224c llvm-8.0.0.src.tar.xz
> +sha256 24b67da19b1422a819395738cb83ea34eee3fdce52870b0d1758524ba1615069 LICENSE.TXT

When the license file hash is changed, we want to have an explanation
in the commit log about what changed. This allows us to make sure that
the hash was not blindly updated, without looking at the actual license
file changes.

The same comment applies to your clang patch in the same series.

Could you adjust this and send a new iteration ?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
