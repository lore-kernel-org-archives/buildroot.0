From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Nov 2015 15:27:44 +0100
Subject: [Buildroot] [PATCH 2/7 v3] autobuild: store PID to PID file
In-Reply-To: <f019be8cc9f667ab1cc5fc03dbce926482790945.1448663846.git.yann.morin.1998@free.fr>
References: <cover.1448663846.git.yann.morin.1998@free.fr>
 <f019be8cc9f667ab1cc5fc03dbce926482790945.1448663846.git.yann.morin.1998@free.fr>
Message-ID: <20151128152744.40a1ed36@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Fri, 27 Nov 2015 23:39:09 +0100, Yann E. MORIN wrote:
> Let the autobuild script store its own PID file, rather than retrieve it
> from the init script.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  scripts/autobuild-run | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to buildroot-test, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
