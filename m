From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2016 12:59:04 +0200
Subject: [Buildroot] [PACH: for-master] package/openpowerlink: fix build
 issue with debugging symbols
In-Reply-To: <1463949950-14164-1-git-send-email-romain.naour@gmail.com>
References: <1463949950-14164-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160523125904.3b158bd7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 May 2016 22:45:50 +0200, Romain Naour wrote:
> Update the top level build patch to fix a build issue with debugging symbols.
> 
> This only affect the demo applications build.
> 
> Fixes:
> http://autobuild.buildroot.net/results/da4/da445b65cb136d71577f04e3a17fdb2ef6302a9b
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  .../0005-Add-top-level-CMakeLists.txt.patch        | 31 +++++++++++++++++++---
>  1 file changed, 27 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
