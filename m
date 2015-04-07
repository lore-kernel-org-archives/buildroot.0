From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 22:28:11 +0200
Subject: [Buildroot] [PATCH 1/1 v3] allow xserver without the systemd
 login daemon.
In-Reply-To: <1427834462-23412-1-git-send-email-sagaert.johan@proximus.be>
References: <1427834462-23412-1-git-send-email-sagaert.johan@proximus.be>
Message-ID: <20150407222811.24e67ca8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Tue, 31 Mar 2015 22:41:02 +0200, Sagaert Johan wrote:
> 
> Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>

Applied, after tweaking the commit log to include the name of the
affected package. Sagaert: all commit title should have the form:

	<package>: <description>

Note that systemd-logind support actually doesn't require systemd, it
only needs D-Bus and udev. But since it certainly doesn't make sense
without systemd in the system, I believe your patch is a good enough
solution.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
