From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Sep 2011 09:26:21 +0200
Subject: [Buildroot] [PATCH] libconfuse: bump to version 2.7 take 4
In-Reply-To: <4E5207B1.7000409@ethertek.ca>
References: <4E4DA5E3.9060707@ethertek.ca> <4E4DEB3A.3030402@ethertek.ca>
 <20110819110643.600032d6@skate> <4E4E7D62.2060008@ethertek.ca>
 <4E5207B1.7000409@ethertek.ca>
Message-ID: <20110901092621.4a77e73c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Dan,

Le Mon, 22 Aug 2011 00:39:29 -0700,
Dan Pattison <dan.pattison@ethertek.ca> a ?crit :

> Sorry for multiple patch submissions. I think I got it right this time.

It is almost right, except for this sentence. Basically, in your email,
everything that is above the --- marker (just below your Signed-off-by
line) becomes the commit log that gets stored for the eternity in the
project history. Therefore, we typically don't include "personal"
messages such as this one.

If you really want to add a personal message, put it between the ---
marker and the beginning of the patch itself.

Could you repost a new version with this fixed ?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
