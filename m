From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Sep 2020 09:59:46 +0200
Subject: [Buildroot] Adding BR2_PACKAGE_PYTHON3 make U-Boot build fail
In-Reply-To: <0e656f84d103ddcf24516f1f2a4de02122af9c19.camel@brainlab.com>
References: <d30bce23621c48874241cbd24e7c85a741067991.camel@brainlab.com>
 <20200915152720.355ef868@windsurf.hq.k.grp>
 <d767bea6910b5a518802f2b7bb99efe7349e20f0.camel@brainlab.com>
 <20200915154450.55b1c6d1@windsurf.hq.k.grp>
 <0e656f84d103ddcf24516f1f2a4de02122af9c19.camel@brainlab.com>
Message-ID: <20200916095946.5a3e599d@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Sep 2020 07:56:46 +0000
Jonatan Hatakeyama Zeidler <jonatan.zeidler@brainlab.com> wrote:

> I solved the problem for me with adding a patch that changes the
> script's shebang to `python2`.

Yes, that will indeed fix it, though we could probably have a better
solution that works "out of the box".

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
