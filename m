From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Mar 2014 23:09:06 +0100
Subject: [Buildroot] [PATCH 1/1] ljsyscall: move installation path to
 /usr/share/lua/5x
In-Reply-To: <1391135391-1953-1-git-send-email-danomimanchego123@gmail.com>
References: <1391135391-1953-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20140306230906.26de87ef@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Thu, 30 Jan 2014 21:29:51 -0500, Danomi Manchego wrote:
> Move ljsyscall install destination to /usr/share/lua/$(abiver}, to
> match what the luarocks install would naturally do.  This also
> reflects the value of INSTALL_LMOD in the luajit.pc file.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/ljsyscall/ljsyscall.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
