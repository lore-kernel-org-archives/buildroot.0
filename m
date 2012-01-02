From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Jan 2012 22:49:57 +0100
Subject: [Buildroot] [PATCH 1/1] busybox: enable
	CONFIG_FEATURE_MDEV_RENAME
In-Reply-To: <fffe1c804316e582ce858ed3a3bb594559c34bab.1324721862.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 24 Dec 2011 11:17:51 +0100")
References: <cover.1324721862.git.thomas.petazzoni@free-electrons.com>
 <cover.1324721862.git.thomas.petazzoni@free-electrons.com>
 <fffe1c804316e582ce858ed3a3bb594559c34bab.1324721862.git.thomas.petazzoni@free-electrons.com>
Message-ID: <871urh22re.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Our default mdev.conf file in package/busybox has lines like:
 Thomas>   pcm.*           root:audio 660 =snd/
 Thomas>   event[0-9]+     root:root 640 =input/

 Thomas> that are used to create the device is the appropriate /dev
 Thomas> subdirectory. However, this feature requires
 Thomas> CONFIG_FEATURE_MDEV_RENAME to be enabled, otherwise mdev complains
 Thomas> with:

 Thomas>   mdev: bad line 25

Committed, thanks.

-- 
Bye, Peter Korsgaard
