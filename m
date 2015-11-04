From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 12:03:19 +0100
Subject: [Buildroot] [PATCH] protobuf: bump to 2.6.1
In-Reply-To: <1446626241-25745-1-git-send-email-steven@uplinklabs.net>
References: <1446626241-25745-1-git-send-email-steven@uplinklabs.net>
Message-ID: <20151104120319.30a10287@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steven Noonan,

On Wed,  4 Nov 2015 00:37:21 -0800, Steven Noonan wrote:
> Signed-off-by: Steven Noonan <steven@uplinklabs.net>
> ---
>  package/protobuf/protobuf.hash | 2 ++
>  package/protobuf/protobuf.mk   | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>  create mode 100644 package/protobuf/protobuf.hash

There have already been several attempts at bumping protobuf to 2.6.x,
but each time there were some issues.

Search for:

Subject: [Buildroot] [PATCH 1/1] protobuf: bump version to 2.6.1
Date: Mon, 22 Jun 2015 14:58:59 -0300

Subject: [Buildroot] [PATCH 1/1] protobuf/protobuf-c: bump versions
Date: Thu, 13 Aug 2015 21:41:21 -0400

Can you look into these threads and check that your bump takes into
account those problems ?

Most notably, make sure that protobuf-c builds fine, and
python-protobuf builds fine. But look at the threads for other
potential issues.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
