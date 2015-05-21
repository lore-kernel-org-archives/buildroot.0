From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 23:54:40 +0200
Subject: [Buildroot] [PATCH v3] package/boost: bump to version 1.58.0
In-Reply-To: <1430570700-26938-1-git-send-email-joerg.krause@embedded.rocks>
References: <1430570700-26938-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150521235440.676d8a17@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sat,  2 May 2015 14:45:00 +0200, J?rg Krause wrote:
> Add patch to fix build issues for mips and sh targets:
> error: unrecognized command line option '-m32'
> 
> Fixes:
> http://autobuild.buildroot.org/results/66c/66c3a868816dfe4bd4d0ffafec6988fd87a2c058/
> http://autobuild.buildroot.net/results/ccd/ccd5c83963032ba49b1627b1dff39e34a9486943/
> 
> Patch send upstream:
> https://github.com/boostorg/build/pull/76
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> Changes v2 -> v3:
>   - Replace upstream patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
