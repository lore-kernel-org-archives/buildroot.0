From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Oct 2019 10:01:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/qemu: fix qemu 3.1.1.1 to build
 with >glib-2.29
In-Reply-To: <20191025104257.3178713-1-pmatos@igalia.com> (Paulo Matos's
 message of "Fri, 25 Oct 2019 12:42:57 +0200")
References: <20191025104257.3178713-1-pmatos@igalia.com>
Message-ID: <87d0ee4nfs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paulo" == Paulo Matos <pmatos@igalia.com> writes:

 > These patches are already in qemu upstream under:
 > - 184943d827ce09375284e6fbb9fd5eeb9e369529
 > - 71ba74f67eaca21b0cc9d96f534ad3b9a7161400

 > They rename gettid() to sys_gettid() to avoid clash with glibc

 > Signed-off-by: Paulo Matos <pmatos@igalia.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
