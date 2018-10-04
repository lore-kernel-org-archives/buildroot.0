From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Oct 2018 14:17:59 +0200
Subject: [Buildroot] [PATCH 23/23] python-crossbar: bump to version
 18.9.2
In-Reply-To: <20180926153505.3411-24-asafka7@gmail.com>
References: <20180926153505.3411-1-asafka7@gmail.com>
 <20180926153505.3411-24-asafka7@gmail.com>
Message-ID: <20181004141759.300264c0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Sep 2018 18:35:05 +0300, Asaf Kahlon wrote:
> Update dependencies (and fix alphabetical order).
> Add patch to remove idna direct dependency (was sent to upstream too:
> https://github.com/crossbario/crossbar/pull/1406).
> 
> Fixes:
> http://autobuild.buildroot.org/results/31d/31db5fd90514906a8c77f921c9650a386ec80101/
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  .../0002-Remove-idna-requirement.patch        | 26 +++++++++++++
>  .../0002-Rework-runtime-dependencies.patch    | 37 -------------------
>  package/python-crossbar/Config.in             | 19 +++++-----
>  package/python-crossbar/python-crossbar.hash  |  7 ++--
>  package/python-crossbar/python-crossbar.mk    |  4 +-
>  5 files changed, 41 insertions(+), 52 deletions(-)
>  create mode 100644 package/python-crossbar/0002-Remove-idna-requirement.patch
>  delete mode 100644 package/python-crossbar/0002-Rework-runtime-dependencies.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
