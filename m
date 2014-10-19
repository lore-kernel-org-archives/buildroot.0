From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 23:01:40 +0200
Subject: [Buildroot] [PATCHv2 buildroot-test 03/11] autobuild-run:
 create main method to locally-scope all variables
In-Reply-To: <1413747007-24990-4-git-send-email-patrickdepinguin@gmail.com>
References: <1413747007-24990-1-git-send-email-patrickdepinguin@gmail.com>
 <1413747007-24990-4-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20141019230140.0007c3fa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 19 Oct 2014 21:29:59 +0200, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> In the current autobuild-run script, all variables created in the 'main'
> part are in fact global, even though the script does not intend them to
> be. For example, sysinfo is global, even though it is passed as function
> argument to run_instance.
> 
> To avoid this accidental globalization, create a main method instead.
> All variables created therein are now local to that method.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Acked-by: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
> ---
> v2: no changes

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
