From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Oct 2018 14:17:51 +0200
Subject: [Buildroot] [PATCH 22/23] python-twisted: bump to version 18.7.0
In-Reply-To: <20180926153505.3411-23-asafka7@gmail.com>
References: <20180926153505.3411-1-asafka7@gmail.com>
 <20180926153505.3411-23-asafka7@gmail.com>
Message-ID: <20181004141751.77e6303b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Sep 2018 18:35:04 +0300, Asaf Kahlon wrote:
> Add license hash.
> 
> Add a patch to fit python3.7 syntax ("async" is now a keyword).
> The patch was already applied on upstream, but only after the last tag
> was created.
> 
> Fixes:
> http://autobuild.buildroot.org/results/704/7043ccfac86439406480649b3ead4882112d36e2/
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  .../0001-Fix-syntax-for-python3.7.patch       | 160 ++++++++++++++++++
>  package/python-twisted/Config.in              |   2 +
>  package/python-twisted/python-twisted.hash    |   8 +-
>  package/python-twisted/python-twisted.mk      |   4 +-
>  4 files changed, 169 insertions(+), 5 deletions(-)
>  create mode 100644 package/python-twisted/0001-Fix-syntax-for-python3.7.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
