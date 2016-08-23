From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 22:32:35 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-08-22
In-Reply-To: <aabf8490-2a2f-8b5b-5edb-15a83ed00924@gmail.com>
References: <20160823093702.D278F1093B5@stock.ovh.net>
 <aabf8490-2a2f-8b5b-5edb-15a83ed00924@gmail.com>
Message-ID: <20160823223235.34842da0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Aug 2016 22:12:34 +0200, Romain Naour wrote:

> >          arm |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/3d4df873a3d4fa199e03d8aa8694eafeac474e5a
> >       x86_64 |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/407ccac95d02715ef9059b9a1282e21dc465af98
> >          arm |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/07e25821bb7538f765af1f9c9513998e86f3ec5e
> >       x86_64 |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/ea39becf5561d1fd4c9535ee1225b8ddc859bafe  
> 
> What do we do for lvm2 with musl ?
> Bernd proposed a fix [1] and reported the issue on the lvm2 mailing list [2].
> Several version bump has been done since then.
> 
> Best regards,
> Romain
> 
> [1] http://patchwork.ozlabs.org/patch/573519/
> [2] https://www.redhat.com/archives/linux-lvm/2016-February/msg00024.html

Well, I had a look at this specifically a few days ago. Someone needs
to take the lead and continue the upstreaming effort, in a way that
pleases the upstream maintainer.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
