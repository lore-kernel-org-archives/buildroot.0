From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 13:17:08 +0100
Subject: [Buildroot] [PATCH] package/glib-networking: bump to 2.58.0
In-Reply-To: <1547560772-53599-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Tue, 15 Jan 2019 07:59:32 -0600")
References: <1547560772-53599-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87sgxser0b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > In 2.56.1 (when tested in a namespace sandbox that restricted what
 > the build could see on the host system), it was discovered that the
 > glib-networking build would check in /etc for the Certificate Authority
 > files. The newer version of this package no longer tests the build time
 > location of the Certificate Authority and resolves these build failures.

 > Fixes:
 > http://autobuild.buildroot.net/results/8f8/8f83be0c21c21c07d5a7330f3626b739b1970625
 > (and others http://autobuild.buildroot.net/?reason=glib-networking-2.56.1)

 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
