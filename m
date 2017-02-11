From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Feb 2017 15:18:44 +0100
Subject: [Buildroot] [PATCH] wget: add upstream patch to fix build
 failure
In-Reply-To: <1486709680-22035-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1486709680-22035-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20170211151844.47b11dd0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Feb 2017 12:24:40 +0530, Rahul Bedarkar wrote:
> Fixes:
>   http://autobuild.buildroot.net/results/c86/c8657563e63e1012a3ae3c0c47663a951e280022
> 
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  ...ve-skipping-libunistring-with-disable-iri.patch | 34 ++++++++++++++++++++++
>  package/wget/wget.mk                               |  3 ++
>  2 files changed, 37 insertions(+)
>  create mode 100644 package/wget/0002-Remove-skipping-libunistring-with-disable-iri.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
