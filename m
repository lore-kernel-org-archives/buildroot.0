From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 20:48:49 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-09-06
In-Reply-To: <87v9gpa5sr.fsf@posteo.net>
References: <notmuch-sha1-49b8b2482171f546326fa9fe8d30bb8818be6e39>
 <87v9gpa5sr.fsf@posteo.net>
Message-ID: <20200907204849.7fdb07f3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Aleksander,

On Mon, 07 Sep 2020 18:51:48 +0200
Alexander Egorenkov <egorenar-dev@posteo.net> wrote:

> >     arch     |             reason             |                                       url                                      
> > -------------+--------------------------------+---------------------------------------------------------------------------------
> >    mipsel    |       makedumpfile-1.6.7       | http://autobuild.buildroot.net/results/a8dacb1cc74e181c6b19b7fb4731899805bc47aa
> >     sh4      |       makedumpfile-1.6.7       | http://autobuild.buildroot.net/results/0e20c17bd604ee1168cc379061c120a2d8263e5f
> >   nds32le    |       makedumpfile-1.6.7       | http://autobuild.buildroot.net/results/000f622085b5b54c1b7f59d0c41ce1480c28b68e
>
> wasn't it fixed by commit
> 
> commit 34b3a071a0b038870379244a2c2264d8802e41a3
> Author: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Date:   Sun Sep 6 10:00:28 2020 +0200
> 
>     package/makedumpfile: add BR2_PACKAGE_MAKEDUMPFILE_ARCH_SUPPORTS

All those build results were generated *before* the commit you mention.
If you take the build result URL, for example:

  http://autobuild.buildroot.net/results/a8dacb1cc74e181c6b19b7fb4731899805bc47aa

Then you can see a file called "gitid" which shows at which Buildroot
commit this build was done. In this case:
3d0c31633d170406ffd1678d56b7ca34aac0ee68, which predates when the
makedumpfile fix was committed.

The builds of our autobuilders are done 24/7, and each morning
(European time) we send an e-mail which notifies developers of the
builds that occurred during the past day (i.e between midnight and
midnight, European time). Therefore, it is possible to be notified of
build failures that have already been fixed in the mean time.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
