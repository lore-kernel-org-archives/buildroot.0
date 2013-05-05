From: Adam Nielsen <a.nielsen@shikadi.net>
Date: Sun, 05 May 2013 12:11:16 +1000
Subject: [Buildroot] initramfs doesn't get linked into kernel
In-Reply-To: <km4dn6$7ds$1@ger.gmane.org>
References: <klf34k$81s$1@ger.gmane.org> <20130427031758.363b222f@skate>
 <klg76d$b42$1@ger.gmane.org> <20130427193407.0e7423c6@skate>
 <klhkoe$dak$1@ger.gmane.org> <km1kpr$t5l$1@ger.gmane.org>
 <20130504102552.03b360ae@skate> <km2rp9$jgd$1@ger.gmane.org>
 <20130504193618.729e01cb@skate> <km4dn6$7ds$1@ger.gmane.org>
Message-ID: <km4f40$gck$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> However it may be because disabling thread support in buildroot does not
> disable thread support in uClibc.  The two options must be set manually.

Please ignore this point, it was because I wasn't doing a 'make clean' after 
disabling thread support, so the uClibc config file wasn't being regenerated.

But the rest of my previous message still applies even after a 'make clean'.

Cheers,
Adam.
