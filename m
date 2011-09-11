From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 11 Sep 2011 19:55:27 +0200
Subject: [Buildroot] [PATCH] libconfuse: bump to version 2.7 take 5
In-Reply-To: <4E6CD6BC.9090001@ethertek.ca> (Dan Pattison's message of "Sun,
 11 Sep 2011 08:41:48 -0700")
References: <4E4DA5E3.9060707@ethertek.ca> <4E4DEB3A.3030402@ethertek.ca>
 <20110819110643.600032d6@skate> <4E4E7D62.2060008@ethertek.ca>
 <4E5207B1.7000409@ethertek.ca> <4E5F9B15.6030905@ethertek.ca>
 <87r53ngqzu.fsf@macbook.be.48ers.dk> <4E6CD6BC.9090001@ethertek.ca>
Message-ID: <87mxebge0g.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Dan" == Dan Pattison <dan.pattison@ethertek.ca> writes:

 Dan> I will figure out git send-email next time instead of copy-paste.

Great, thanks.

 Dan> This line should be added to the patch;

 Dan> +LIBCONFUSE_INSTALL_TARGET = YES

 Dan> Sorry I missed that.

No, that isn't needed as it defaults to YES (that's why I dropped it
from the patch):

make -s libconfuse 2>/dev/null |grep '>>>'
>>> libconfuse 2.7 Extracting
>>> libconfuse 2.7 Patching package/libconfuse
>>> libconfuse 2.7 Patching libtool
>>> libconfuse 2.7 Configuring
>>> libconfuse 2.7 Building
>>> libconfuse 2.7 Installing to staging directory
>>> libconfuse 2.7 Installing to target

-- 
Bye, Peter Korsgaard
