From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 13 Jul 2017 09:55:37 -0500
Subject: [Buildroot] [PATCH-2017.05.x] uboot-tools: disable libfdt swig
 wrapper for host
In-Reply-To: <20170713061905.15801-1-joerg.krause@embedded.rocks>
References: <20170713061905.15801-1-joerg.krause@embedded.rocks>
Message-ID: <CANQCQpavVt1koCeb4Gm9Uf8idyDFyjePabQqUFrKpT7KS7a1mQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jorg,

On Thu, Jul 13, 2017 at 1:19 AM, J?rg Krause
<joerg.krause@embedded.rocks> wrote:
> Commit f4891c398e599f18bbf41eb33885930431f5e1c8 [1] added a workaround to
> disable the build of the python libfdt module if swig is available on the
> host.
>
> This workaround is also necessary when building the host uboot-tools.
>
> Note, that the issue was introduced in upstream commit
> 1905c8fc711a527ff10550425498bc77e4db9ac3 [2] and released in version
> U-Boot version 2017.03 and fixed in version 2017.07 (see [3]).
>
> [1] https://git.busybox.net/buildroot/commit/package/uboot-tools?h=master&id=f4891c398e599f18bbf41eb33885930431f5e1c8
> [2] http://git.denx.de/?p=u-boot.git;a=commit;h=1905c8fc711a527ff10550425498bc77e4db9ac3
> [3] http://patchwork.ozlabs.org/patch/787412/
>
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Acked-by: Matt Weber <matthew.weber@rockwellcollins.com>
