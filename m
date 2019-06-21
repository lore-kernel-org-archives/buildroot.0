From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Jun 2019 22:28:55 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-daemon: bump to version
 2.2.3
In-Reply-To: <1561121063-19216-1-git-send-email-pjtexier@koncepto.io>
References: <1561121063-19216-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20190621222855.1f986822@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 21 Jun 2019 14:44:22 +0200
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  package/python-daemon/python-daemon.hash | 6 +++---
>  package/python-daemon/python-daemon.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

I have applied both patches. However, for your patches that add the
hashes of the license files, the title "fix legal-info" is a bit
incorrect. Indeed, the legal-info is not wrong, it's just that the
hashes are missing for the license files. So a better commit title is
"add hashes for license files".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
