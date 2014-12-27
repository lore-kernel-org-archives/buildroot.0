From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 17:28:58 +0100
Subject: [Buildroot] [PATCH] package/libxkbcommon: fix builds
 with/without X11
In-Reply-To: <1419697349-24929-1-git-send-email-yann.morin.1998@free.fr>
References: <1419697349-24929-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20141227172858.57c3848f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 27 Dec 2014 17:22:29 +0100, Yann E. MORIN wrote:
> We need to explicitly disable X11 support when X11 is not available.
> Conversely, when it is, we need to add the required dependencies.
> 
> Fixes a slew of autobuild failures:
>     http://autobuild.buildroot.org/results/587/58794f894a4950b77e38d5fc877852d6cc507d8c/
>     http://autobuild.buildroot.org/results/927/92741f6b9b7909b226c200e453ac6cee8af5abd6/
>     http://autobuild.buildroot.org/results/51c/51cb09f7f267319948c685f905e29afe99f59589/
>     ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Fatih A??c? <fatih.asici@gmail.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
