From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  7 Jun 2013 10:58:24 +0000 (UTC)
Subject: [Buildroot] [Bug 6302] Versions of packages retrieved from
	github.com are wrong
In-Reply-To: <bug-6302-163@https.bugs.busybox.net/>
References: <bug-6302-163@https.bugs.busybox.net/>
Message-ID: <20130607105824.3CF9B9A9E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6302

--- Comment #4 from Andrew Scheller <uclibc-bugzilla@loowis.durge.org> 2013-06-07 10:56:41 UTC ---
Fantastic, thanks to all involved (and so quick too!).

Just for my future reference, this is the related mailing-list thread
http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/60950 and these are the
git commit ids that were involved in fixing this bug:
f0f124f36a8616a1e0895b2eb9411a8459daa3c9  (jsmin)
9bb2757c461271f4458294d417f440f839513e33  (libcofi)
b89e8141e3247e28387e14a2959d3ec8ea11f12c  (linenoise)
55c90b10b3c73ff0708ceb73645c51658f4821aa  (lua-msgpack-native)
e9c9bd2d62a1d09f2f54b55f05301be0e06981df  (mtdev2tuio)
c2b205c038bc0dba3960917f2eb1bd30fbc24b03  (ne10)
ae5be552b6435437db42b168b61aa15b8bed2fbc  (omap-u-boot-utils)
6b16001d4f026fd08f14a4b2043710531b50a0ad  (rpi-firmware)
8645437c0cc0fffa6962030ddd90698ab917891e  (rpi-userland)
fe64434df6c8a5f3516f92caf9c04d6dedda444b  (socketcand)
8ad0ab6e16e67a1d1269aec7ddc1b70d10d86e82  (sunxi-boards)
63c39b52ce3cfacf12071e8d76a5a30c57fe54d6  (sunxi-tools)
7869f83bda815279f8245913d33062e525d4efe1  (ti-utils)
013365238f0b00f01dcc173edf2f3b6e37f7beb1  (tslib)
484b6dd8a3abccf0be34d1bed3761a8809ba23be  (manual)
86bfe7cca9bca292f00f7a41221ae5879f4a5769  (manual)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
