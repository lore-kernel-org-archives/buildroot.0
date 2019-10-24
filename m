From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 24 Oct 2019 10:21:01 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-10-03
In-Reply-To: <1gm78gx84n.ln2@ID-313208.user.individual.net>
References: <20191004061739.7A2A9877A0@whitealder.osuosl.org>
 <1gm78gx84n.ln2@ID-313208.user.individual.net>
Message-ID: <20191024102101.176e7b01@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 24 Oct 2019 06:38:57 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> bug is also present on master branch
> 
> http://autobuild.buildroot.net/results/d8e/
> d8e8c658476c4d51b9fd13021b293b1890292620/
> 
> and is fixed by a patch which is part of this series:
> 
> http://patchwork.ozlabs.org/project/buildroot/list/?series=133684

Unfortunately, it is not "fixed", but worked around, and the proper fix
is in elf2flt, to make it support those relocation types.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
