From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 17:20:55 +0100
Subject: [Buildroot] [PATCH 5/5] guile: fix libltdl and libgmp detection
In-Reply-To: <1419688038-15640-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1419688038-15640-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1419688038-15640-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141227172055.6b27c01d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 27 Dec 2014 14:47:18 +0100, Thomas Petazzoni wrote:
> Explicitly pass the path to libtldl and libgmp, so that guile does not
> try to use host versions when available.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/056/056b7fcbf3b73a8d15ca635b000771cdc2d7fbf9/
> 
> And another similar problem with libgmp.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/guile/guile.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, with the addition of --with-libunistring-prefix, as suggested
by Samuel Martin.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
