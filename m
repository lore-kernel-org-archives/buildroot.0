From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2016 22:11:53 +0100
Subject: [Buildroot] [PATCH] package/kexec-lite: Update to latest version
In-Reply-To: <20161125021953.17593-1-sam@mendozajonas.com>
References: <20161125021953.17593-1-sam@mendozajonas.com>
Message-ID: <20161125221153.368c8b71@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 25 Nov 2016 13:19:53 +1100, Samuel Mendoza-Jonas wrote:
> Upstream kexec-lite now has support for kexec on POWER9 based machines.
> Update so this works in simulators and is ready for when real machines
> are available.
> 
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> ---
>  package/kexec-lite/kexec-lite.hash | 2 +-
>  package/kexec-lite/kexec-lite.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
