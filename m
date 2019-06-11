From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Jun 2019 22:31:13 +0200
Subject: [Buildroot] [PATCH 1/2] package/rauc: bump to version 1.1
In-Reply-To: <1560274438-22422-1-git-send-email-pjtexier@koncepto.io>
References: <1560274438-22422-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20190611223113.16ff11f3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 11 Jun 2019 19:33:57 +0200
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> See: https://github.com/rauc/rauc/releases/tag/v1.1
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
> Tested on WaRP7:
> 	Welcome to Buildroot
> 	buildroot login: root
> 	# rauc --version
> 	rauc 1.1
> 	
>  package/rauc/rauc.hash | 4 ++--
>  package/rauc/rauc.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Both patches applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
