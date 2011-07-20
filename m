From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 20 Jul 2011 17:42:52 +0200
Subject: [Buildroot] ccache directory
Message-ID: <CAAXf6LUROj4Pg2TLKETfo5SNYuC=teuFbcHEyhELuvmmTNTwvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Peter,

A while ago, there were some changes in the ccache handling, with
which the cache location also changed to $(HOME)/.buildroot-ccache.
Before that, the cache directory was configurable in .config. What is
the reason of changing the cache location?

In my (corporate) environment, the home directories are actually on
the network (NFS) which is not ideal for performance. I would like to
configure another cache directory.

Would you accept a patch that re-introduces BR2_CCACHE_DIR ?

Thanks,
Thomas
