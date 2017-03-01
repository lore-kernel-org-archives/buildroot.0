From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 23:22:21 +0100
Subject: [Buildroot] [PATCHv3 01/12] toolchain-external: reduce nesting
 in copy_toolchain_sysroot
In-Reply-To: <20170207215649.364-2-patrickdepinguin@gmail.com>
References: <20170207215649.364-1-patrickdepinguin@gmail.com>
 <20170207215649.364-2-patrickdepinguin@gmail.com>
Message-ID: <20170301232221.1ed15074@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  7 Feb 2017 22:56:38 +0100, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> As discussed with Thomas Petazzoni, we can reduce the nesting level by early
> returning on an invalid iteration.
> 
> I did not move the 'else' case (the common case) outside the if-else because
> it would make the code less symmetrical and IMO makes it _less_ clear.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
> v3: new patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
