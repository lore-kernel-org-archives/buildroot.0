From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Sep 2019 22:07:57 +0200
Subject: [Buildroot] [PATCH 1/2] package/collectd: remove libvirt from
 list of disabled plugins
In-Reply-To: <20190804150957.7844-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 4 Aug 2019 17:09:56 +0200")
References: <20190804150957.7844-1-bernd.kuhls@t-online.de>
Message-ID: <87a7bn3hlu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > With collectd 5.5.0 the "libvirt plugin has been renamed to virt":
 > https://git.octo.it/?p=collectd.git;a=blob;f=ChangeLog;h=b0a997c53ac1a74bc39470bdd243f853fa095c9f;hb=refs/tags/collectd-5.5.0#l235

 > "virt" is already mentioned in COLLECTD_PLUGINS_DISABLE so we can just
 > remove "libvirt" to fix:

 > configure: WARNING: unrecognized options: [...] --disable-libvirt

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
