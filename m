From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Feb 2016 23:22:13 +0100
Subject: [Buildroot] [PATCH 1/1] libfcgi:add security patch for
 CVE-2012-6687
In-Reply-To: <1454650180-31432-1-git-send-email-niranjan.reddy@rockwellcollins.com>
References: <1454650180-31432-1-git-send-email-niranjan.reddy@rockwellcollins.com>
Message-ID: <20160205232213.7f1b8a51@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Niranjan,

Could you fix your mail configuration so that your From is:

	Niranjan Reddy <niranjan.reddy@rockwellcollins.com>

Indeed, the From: field gets used as the Git author.

On Fri,  5 Feb 2016 10:59:40 +0530, niranjan.reddy wrote:
> Fix-CVE-2012-6687 - remote attackers cause a denial of service (crash)
> via a large number of connections (http://www.cvedetails.com/cve/CVE-2012-6687/).
> use poll in os_unix.c instead of select to avoid problem with > 1024 connections.
> The patch libfcgi_2.4.0-8.3.debian.tar.xz is taken from the below link:
> (https://launchpad.net/ubuntu/+source/libfcgi/2.4.0-8.3)

I don't understand, I had a look at this Debian tarball, and couldn't
spot the fix. Also below, you're signing off the patch, which seems to
indicate your are the author of it.

Could you clarify ?

> The next release of libfcgi is 2.4.1 which may have this fix is yet to be released
> officially.
> 
> Signed-off-by: niranjan.reddy <niranjan.reddy@rockwellcollins.com>

Please use Niranjan Reddy and not niranjan.reddy.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
