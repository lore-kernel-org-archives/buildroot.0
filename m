From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 06 Mar 2012 12:44:57 +0100
Subject: [Buildroot] [Patch v2 1/1] mysql_client : bump to latest 5.1.60
 version
In-Reply-To: <1330968419-20379-1-git-send-email-sagaert.johan@skynet.be>
References: <1330968419-20379-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <4F55F8B9.3090706@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sagaert,

thanks for having submitted a corrected patch.

Sagaert Johan wrote:
> Updates mysql_client to the latest 5.1.60 version, the verion 5.1.53 patches have been renamed to 5.1.60
>
> Signed-off-by: Sagaert Johan<sagaert.johan@skynet.be>
> ---
>   .../mysql_client-5.1.53-ac_cache_check.patch       |  156 --------------------
>   ...ql_client-5.1.53-configure-ps-cache-check.patch |   39 -----
>   ...ysql_client-5.1.53-use-new-readline-iface.patch |   21 ---
>   .../mysql_client-5.1.60-ac_cache_check.patch       |  156 ++++++++++++++++++++
>   ...ql_client-5.1.60-configure-ps-cache-check.patch |   39 +++++
>   ...ysql_client-5.1.60-use-new-readline-iface.patch |   21 +++
>   package/mysql_client/mysql_client.mk               |    2 +-
>   7 files changed, 217 insertions(+), 217 deletions(-)
>   delete mode 100644 package/mysql_client/mysql_client-5.1.53-ac_cache_check.patch
>   delete mode 100644 package/mysql_client/mysql_client-5.1.53-configure-ps-cache-check.patch
>   delete mode 100644 package/mysql_client/mysql_client-5.1.53-use-new-readline-iface.patch
>   create mode 100644 package/mysql_client/mysql_client-5.1.60-ac_cache_check.patch
>   create mode 100644 package/mysql_client/mysql_client-5.1.60-configure-ps-cache-check.patch
>   create mode 100644 package/mysql_client/mysql_client-5.1.60-use-new-readline-iface.patch

The next time you submit a patch that renames or moves files you should
pass the -M option to git diff / git format-patch / whatever. This will make
renames and moves appear much less verbose and much more readable
than this.

Anyway this only changes how the patch is presented, not the actual
changes to the tree, so I don't think there is any need to submit your patch
once again.

Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

Luca
