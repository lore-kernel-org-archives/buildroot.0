From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 15:16:34 +0200
Subject: [Buildroot] [PATCH] python-libconfig: fix Python3 build
In-Reply-To: <20170727084515.19623-1-yegorslists@googlemail.com>
References: <20170727084515.19623-1-yegorslists@googlemail.com>
Message-ID: <20170729151634.73008b3a@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Jul 2017 10:45:15 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> boost_python library is named boost_python3, if boost is built
> under Python3 environment. The patch fixes setup.py accordingly.
> 
> Fixes:
> http://autobuild.buildroot.net/results/975/97533965180436c2f7a99de07fdc360ef57f84b0
> http://autobuild.buildroot.net/results/b49/b49de32704f0f7ce5a610cf4363c6dcc2d8bafa1
> http://autobuild.buildroot.net/results/e26/e26b4b9b486c582fb55826817a3428569968320f
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  ...oost_python-name-depending-on-current-Pyt.patch | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/python-libconfig/0001-Determine-boost_python-name-depending-on-current-Pyt.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
