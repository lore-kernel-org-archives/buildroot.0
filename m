From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 May 2016 22:55:24 +0200
Subject: [Buildroot] [PATCH 1/2] package/nodejs: bump version to 6.1.0
In-Reply-To: <1462803501-15901-1-git-send-email-martin@barkynet.com>
References: <1462803501-15901-1-git-send-email-martin@barkynet.com>
Message-ID: <20160509225524.5e93b334@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  9 May 2016 15:18:20 +0100, Martin Bark wrote:
> See https://nodejs.org/en/blog/release/v6.1.0/
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> ---
>  .../{6.0.0 => 6.1.0}/0001-gyp-force-link-command-to-use-CXX.patch     | 0
>  package/nodejs/Config.in                                              | 2 +-
>  package/nodejs/nodejs.hash                                            | 4 ++--
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename package/nodejs/{6.0.0 => 6.1.0}/0001-gyp-force-link-command-to-use-CXX.patch (100%)

Thanks, both patches applied!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
