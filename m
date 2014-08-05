From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Aug 2014 09:46:41 +0200
Subject: [Buildroot] [PATCH 1/2] mongoose: bump to version 5.4
In-Reply-To: <1407187903-10013-1-git-send-email-zinosat@tiscali.it>
References: <1407187903-10013-1-git-send-email-zinosat@tiscali.it>
Message-ID: <20140805094641.3ab434ce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Davide Viti,

On Mon,  4 Aug 2014 23:31:42 +0200, Davide Viti wrote:
> Avoid compilation of the server via the upstream Makefile which
> unconditionally uses -lssl

Ok, but then, don't we want to optionally use the SSL support when
available (i.e when BR2_PACKAGE_OPENSSL=y) ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
