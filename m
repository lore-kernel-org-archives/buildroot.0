From: =?utf-8?B?SsOpcsO0bWU=?= Oufella <jerome.oufella@savoirfairelinux.com>
Date: Wed, 14 Mar 2018 12:05:25 -0400 (EDT)
Subject: [Buildroot] [PATCH v3 4/6] package/mesa3d: enable llvm support
In-Reply-To: <20180309164939.16075-5-valentin.korenblit@smile.fr>
References: <20180309164939.16075-1-valentin.korenblit@smile.fr>
 <20180309164939.16075-5-valentin.korenblit@smile.fr>
Message-ID: <926424479.140878.1521043525947.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> This patch provides LLVM support for Mesa3D, enabling llvmpipe
> software rasterizer.
> 
> It uses llvm-config (host variant) installed in STAGING_DIR/usr/bin
> to get LLVM libraries. Assuming that LLVM version 5.0.1 is installed,
> llvm-config --libs will output -lLLVM-5.0.
> 
> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>

Tested-by: J?r?me Oufella <jerome.oufella@savoirfairelinux.com>
