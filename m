From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 19:05:10 +0100
Subject: [Buildroot] [PATCH] libcap-ng: bump to version 0.7.7
In-Reply-To: <1457132440-20407-1-git-send-email-sergio.prado@e-labworks.com>
References: <1457132440-20407-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20160305190510.5f65bb67@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sergio Prado,

On Fri,  4 Mar 2016 20:00:40 -0300, Sergio Prado wrote:
> Also disable optimization when compiling for nios2 to prevent a compiler
> bug.
> 
> Fixes:
> http://autobuild.buildroot.net/results/3afc4c006a74fd7512dace90b5f884bf7be4cc58/
> http://autobuild.buildroot.net/results/2c53f611a705506ca86fedb0f1129df1d315632c/
> http://autobuild.buildroot.net/results/c3d9477688b55987591b5b5efed5ee65499aa0e6/
> http://autobuild.buildroot.net/results/052ff24f3985b652c11ac390f342e9ad3d862431/
> ...
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  package/libcap-ng/Config.in      | 1 -
>  package/libcap-ng/libcap-ng.hash | 2 +-
>  package/libcap-ng/libcap-ng.mk   | 7 ++++++-
>  3 files changed, 7 insertions(+), 3 deletions(-)

I've removed the nios2 related bits (following the feedback from Romain
Naour), and applied to master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
