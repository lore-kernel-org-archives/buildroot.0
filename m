From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Jan 2013 15:07:09 +0100
Subject: [Buildroot] [PATCH 1/1] cairo : bump version
In-Reply-To: <1358084194-16226-1-git-send-email-sagaert.johan@skynet.be>
References: <1358084194-16226-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20130113150709.76356160@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Sun, 13 Jan 2013 14:36:34 +0100, Sagaert Johan wrote:
> 
> cairo : bump version
> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>

Thanks for all those version bump patches. Unfortunately, the commit
log is wrong: you repeat two times the same thing.

If you put "cairo: bump version" in the first line of your commit log,
then don't put it again, otherwise it appears twice!

And it is also customary to mention the version to which the package is
being bumped in the commit title.

So, your commit logs should be:

===
cairo: bump version to 1.12.8

Signed-off-by: ...
===

If there are more details to be provided:

===
cairo: bump version to 1.12.8

The patch foobar.patch has become useless due to upstream changes. A
new patch barfoo.patch is introduced in order to fix problem blabla.

Signed-off-by: ...
===

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
