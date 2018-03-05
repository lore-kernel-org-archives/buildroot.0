From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 5 Mar 2018 08:05:49 -0300
Subject: [Buildroot] Defconfigs failing to build with gcc 6.x
In-Reply-To: <20180305085751.1b03854f@windsurf.home>
References: <20180304224808.566fa00d@windsurf.home>
 <CAOMZO5DXmGWSbfE9PEp+srYkM8ieMX0NYOmyOgza0cuSHsjr9A@mail.gmail.com>
 <20180305085751.1b03854f@windsurf.home>
Message-ID: <CAOMZO5CtNrJNna_=3-qmBXUs-++cKutSkQtXvT2-yEq9dSh+Kg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 5, 2018 at 4:57 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

> If you don't have access to this board, and nobody else does, isn't it
> better to simply drop the defconfig ?

Yes, agreed.

Matthew has sent a patch removing this defconfig:
http://patchwork.ozlabs.org/patch/881276/
