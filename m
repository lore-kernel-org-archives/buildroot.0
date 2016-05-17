From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 22:33:17 +0200
Subject: [Buildroot] [for-next: PATCH 1/2] toolchain: enable paranoid
 unsafe path check by default
In-Reply-To: <1463307961-29759-1-git-send-email-romain.naour@gmail.com>
References: <1463307961-29759-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160517223317.5c6b4a36@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 15 May 2016 12:26:00 +0200, Romain Naour wrote:
> This check is enabled for all build in the Buildroot autobuilders since [1]
> (i.e since 2015.02 release).
> 
> Enable this option by default.
> 
> [1] https://git.busybox.net/buildroot-test/commit/?id=41552e2a249de4568aa01f14bd588d1c8166f70b
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
