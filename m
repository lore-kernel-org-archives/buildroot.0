From: hartleys <hartleys@visionengravers.com>
Date: Mon, 8 Dec 2008 18:19:18 -0500
Subject: [Buildroot] Problem with diehotplug-0.5.tar
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909E70780@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There appears to be a problem with the 24307 revision of
package/hotplug/diehotplug-0.5.tar. When the build process tries to cat
the file it error's out:

cat package/hotplug/diethotplug-0.5.tar | tar -C
/home/bigguiness/buildroot/build_arm   -xf -
tar: Skipping to next header
tar: Error exit delayed from previous errors

Hartley
