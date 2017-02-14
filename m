From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Feb 2017 22:14:22 +0100
Subject: [Buildroot] [PATCH] cups: add host-pkgconf as a dependency
In-Reply-To: <1487105279-25370-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 14 Feb 2017 21:47:59 +0100")
References: <1487105279-25370-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87a89oiifl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > cups configure script checks for a pkg-config program. If host-pkgconf
 > has not been built prior to cups, it uses the system pkg-config, which
 > might potentially lead to bogus results:

 > checking for i586-buildroot-linux-musl-pkg-config... no
 > checking for pkg-config... /usr/bin/pkg-config

 > With this patch applied:

 > checking for i586-buildroot-linux-musl-pkg-config... no
 > checking for pkg-config... /home/thomas/projets/buildroot/output/host/usr/bin/pkg-config

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
