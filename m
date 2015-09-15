From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 15 Sep 2015 02:01:04 -0400
Subject: [Buildroot] [PATCH 2/2] openssl: enable parallel build and
 installation
In-Reply-To: <1442289591-30376-3-git-send-email-ryanbarnett3@gmail.com>
References: <1442289591-30376-1-git-send-email-ryanbarnett3@gmail.com>
 <1442289591-30376-3-git-send-email-ryanbarnett3@gmail.com>
Message-ID: <20150915060104.GL640@vapier>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14 Sep 2015 22:59, Ryan Barnett wrote:
> +OPENSSL_PATCH = \
> +	https://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/openssl/files/openssl-1.0.2d-parallel-build.patch?revision=1.1

Gentoo has moved to git now, so fetching from cvs will yield stale results
(not that i think the patches have been updated since the move ...)
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150915/249fa0fd/attachment.asc>
