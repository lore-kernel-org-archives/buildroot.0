From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 22:51:39 +0200
Subject: [Buildroot] [PATCH 1/1 v2] libvpx: bump version to 1.4.0
In-Reply-To: <1428447211-24428-1-git-send-email-sagaert.johan@proximus.be>
References: <1428447211-24428-1-git-send-email-sagaert.johan@proximus.be>
Message-ID: <20150408225139.3c65fe12@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Wed,  8 Apr 2015 00:53:31 +0200, Sagaert Johan wrote:
> Use tar.bz2 instead of git.
> Also added the hash file.
> Changes: https://chromium.googlesource.com/webm/libvpx/+/0080aca235e2d677e49ff46c3e8e77d9dd15858c/CHANGELOG
> 
> Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>

Thanks, applied, after removing the unnecessary LIBVPX_VERSION_MAJOR
variable, as suggested by Arnout.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
