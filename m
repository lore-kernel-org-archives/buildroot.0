From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Mar 2016 21:34:25 +0100
Subject: [Buildroot] [PATCH] moarvm: remove host-luajit dependency
In-Reply-To: <1458755804-9455-1-git-send-email-francois.perrad@gadz.org>
References: <1458755804-9455-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20160323213425.7c9d2dc1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Mar 2016 18:56:44 +0100, Francois Perrad wrote:
> now, use the minilua which is embedded in the package.
> that fixes the build issue, see http://autobuild.buildroot.net/results/4dc/4dcbcde0046e265317e170a977e699e5c3a06b87/
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/moarvm/moarvm.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

If moarvm is capable of using an external Lua interpreter rather than
its own embedded copy, then it should use the external Lua interpreter.

The fact that there is a build issue means that it must be solved, not
worked around.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
