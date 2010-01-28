From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Jan 2010 22:52:13 +0100
Subject: [Buildroot] [PATCH 14/19] libxslt: fix dependency on libxml
In-Reply-To: <1264554547-9009-15-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Wed, 27 Jan 2010 02:09:02 +0100")
References: <1264554547-9009-1-git-send-email-llandwerlin@gmail.com>
	<1264554547-9009-15-git-send-email-llandwerlin@gmail.com>
Message-ID: <87d40tnbhu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

 llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> ---
 llandwerlin>  package/libxslt/Config.in  |    1 +
 llandwerlin>  package/libxslt/libxslt.mk |    2 +-
 llandwerlin>  2 files changed, 2 insertions(+), 1 deletions(-)

 llandwerlin> diff --git a/package/libxslt/Config.in b/package/libxslt/Config.in
 llandwerlin> index c318966..23acd18 100644
 llandwerlin> --- a/package/libxslt/Config.in
 llandwerlin> +++ b/package/libxslt/Config.in
 llandwerlin> @@ -1,5 +1,6 @@
 llandwerlin>  config BR2_PACKAGE_LIBXSLT
 llandwerlin>  	bool "libxslt"
 llandwerlin> +        select BR2_PACKAGE_LIBXML2

Indentation should be with a <tab>, otherwise it's fine - Committed.

-- 
Bye, Peter Korsgaard
