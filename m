From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 16 Jun 2013 21:46:13 +0200
Subject: [Buildroot] [PATCH 01/12] coxpcall: Updated source location
In-Reply-To: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com> (Assaf
 Inbal's message of "Mon, 20 May 2013 15:56:33 +0300")
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
Message-ID: <87ip1dvny2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Assaf" == Assaf Inbal <shmuelzon@gmail.com> writes:

 Assaf> Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
 Assaf> ---
 Assaf>  package/coxpcall/coxpcall.mk | 2 +-
 Assaf>  1 file changed, 1 insertion(+), 1 deletion(-)

 Assaf> diff --git a/package/coxpcall/coxpcall.mk b/package/coxpcall/coxpcall.mk
 Assaf> index e7fb76d..f260d72 100644
 Assaf> --- a/package/coxpcall/coxpcall.mk
 Assaf> +++ b/package/coxpcall/coxpcall.mk
 Assaf> @@ -5,7 +5,7 @@
 Assaf>  #############################################################
 
 Assaf>  COXPCALL_VERSION = 1.13.0
 Assaf> -COXPCALL_SITE = http://luaforge.net/frs/download.php/3406
 Assaf> +COXPCALL_SITE = http://github.com/downloads/keplerproject/coxpcall

Ehh, thanks - But it doesn't work:

>>> coxpcall 1.13.0 Downloading
--2013-06-16 21:45:03--  http://github.com/downloads/keplerproject/coxpcall/coxpcall-1.13.0.tar.gz
Resolving github.com (github.com)... 204.232.175.90
Connecting to github.com (github.com)|204.232.175.90|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://github.com/downloads/keplerproject/coxpcall/coxpcall-1.13.0.tar.gz [following]
--2013-06-16 21:45:03--  https://github.com/downloads/keplerproject/coxpcall/coxpcall-1.13.0.tar.gz
Connecting to github.com (github.com)|204.232.175.90|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2013-06-16 21:45:04 ERROR 404: Not Found.


-- 
Bye, Peter Korsgaard
