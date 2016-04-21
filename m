From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 22:41:14 +0200
Subject: [Buildroot] [PATCH 1/2] package/mono: bump to version 4.2.2.30
In-Reply-To: <1455487411-14605-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1455487411-14605-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20160421224114.5740b8a7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 14 Feb 2016 23:03:30 +0100, Angelo Compagnucci wrote:
> This patch bumps mono to the latest 4.2.2.30 version.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  package/mono/mono.hash | 2 +-
>  package/mono/mono.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Mono is still causing some build issues, mainly on SPARC:

  http://autobuild.buildroot.org/?reason=mono-4.2.2.30

Could you have a look, maybe with the help from Waldemar, who knows
about SPARC related stuff?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
