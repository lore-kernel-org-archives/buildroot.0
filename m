From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 08 Jan 2018 22:48:21 +0100
Subject: [Buildroot] [PATCH] tar: do not build SELinux support for host
 variant
In-Reply-To: <20171229202608.1767-1-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 29 Dec 2017 21:26:08 +0100")
References: <20171229202608.1767-1-thomas.petazzoni@free-electrons.com>
Message-ID: <87tvvwowd6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > If we don't explicitly disable SELinux support in the host-tar build,
 > it might pick up system-wide installed SELinux libraries, causing the
 > tar in HOST_DIR/bin/ to depend on the host SELinux libraries, which is
 > not desirable to make the SDK portable/relocatable.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
