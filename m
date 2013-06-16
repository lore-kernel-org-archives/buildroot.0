From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 16 Jun 2013 21:47:46 +0200
Subject: [Buildroot] [PATCH 02/12] luasocket: Update source location
In-Reply-To: <1369054604-26139-2-git-send-email-shmuelzon@gmail.com> (Assaf
 Inbal's message of "Mon, 20 May 2013 15:56:34 +0300")
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
 <1369054604-26139-2-git-send-email-shmuelzon@gmail.com>
Message-ID: <87ehc1vnvh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Assaf" == Assaf Inbal <shmuelzon@gmail.com> writes:

 Assaf> Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
 Assaf> ---
 Assaf>  package/luasocket/luasocket.mk | 2 +-
 Assaf>  1 file changed, 1 insertion(+), 1 deletion(-)

 Assaf> diff --git a/package/luasocket/luasocket.mk b/package/luasocket/luasocket.mk
 Assaf> index 45fb9a3..80cbe24 100644
 Assaf> --- a/package/luasocket/luasocket.mk
 Assaf> +++ b/package/luasocket/luasocket.mk
 Assaf> @@ -5,7 +5,7 @@
 Assaf>  #############################################################
 
 Assaf>  LUASOCKET_VERSION = 2.0.2
 Assaf> -LUASOCKET_SITE = http://luaforge.net/frs/download.php/2664
 Assaf> +LUASOCKET_SITE = http://github.com/downloads/keplerproject/luaosocket

Same as for coxpcall.

-- 
Bye, Peter Korsgaard
