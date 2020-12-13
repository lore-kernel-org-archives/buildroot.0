From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Dec 2020 10:31:42 +0100
Subject: [Buildroot] [PATCH] package/python-urllib3: bump to version
 1.26.2
In-Reply-To: <20201212152822.54384-1-m.niestroj@grinn-global.com>
References: <20201212152822.54384-1-m.niestroj@grinn-global.com>
Message-ID: <20201213103142.677b27d9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Dec 2020 16:28:22 +0100
Marcin Niestroj <m.niestroj@grinn-global.com> wrote:

> -md5  d47dd21a6e66a03c3633cac468ffd010  urllib3-1.25.11.tar.gz
> -sha256  8d7eaa5a82a1cac232164990f04874c594c9453ec55eef02eab885aa02fc17a2  urllib3-1.25.11.tar.gz
> +md5  2233256ccfe140a915f68703f8c2cc1f  urllib3-1.26.2.tar.gz
> +sha256  19188f96923873c92ccb987120ec4acaa12f0461fa9ce5d3d0772bc965a39e08  urllib3-1.26.2.tar.gz
>  # Locally computed sha256 checksums
> -sha256	7c0d136ee0585389adf2d25671bb99687a1f75929f465b7f16ee3f01da37255e  LICENSE.txt
> +sha256  c37bf186e27cf9dbe9619e55edfe3cea7b30091ceb3da63c7dacbe0e6d77907b  LICENSE.txt

You forgot to explain the change of license file hash in the commit
log, so I amended the commit log when applying. Applied to master.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
