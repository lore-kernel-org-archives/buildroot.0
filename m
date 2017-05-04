From: semenak94 at mail.ru <semenak94@mail.ru>
Date: Fri, 05 May 2017 01:02:34 +0300
Subject: [Buildroot]
 =?utf-8?q?=5Bgit_commit=5D_lua-resty-http=3A_new_pack?=
 =?utf-8?q?age?=
Message-ID: <1493935354.76899857@f13.my.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello,
Well, I'm also very far from nginx expert, but yes, it lua-nginx-module, which we need in our special embedded linux. So, if you don't explicitly have nginx modules in buildroot, how should we deal with it?
--
Semyon
-----------
Semyon Kolganov 
???????, 05 ??? 2017?., 00:02 +03:00 ?? Peter Korsgaard peter at korsgaard.com:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>?> commit: https://git.buildroot.net/buildroot/commit/?id=e88995f065986dc56ce5a7c222f7a9f6cbff2b94
>?> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>?> Signed-off-by: Semyon Kolganov <semenak94@mail.ru>
>?> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>?> ---
>?>? DEVELOPERS???????????????????????????????? |? 1 +
>?>? package/Config.in????????????????????????? |? 1 +
>?>? package/lua-resty-http/Config.in?????????? |? 6 ++++++
>?>? package/lua-resty-http/lua-resty-http.hash |? 2 ++
>?>? package/lua-resty-http/lua-resty-http.mk?? | 12 ++++++++++++
>?>? 5 files changed, 22 insertions(+)
>?> +++ b/package/lua-resty-http/Config.in
>?> @@ -0,0 +1,6 @@
>?> +config BR2_PACKAGE_LUA_RESTY_HTTP
>?> + bool "lua-resty-http"
>?> + help
>?> + ? Lua HTTP client cosocket driver for OpenResty / ngx_lua.
>?> +
>?> + ? http://github.com/pintsized/lua-resty-http
>Sorry for the slow response, but this patch apparently never made it to
>my mailbox? (It is in the archive, so it must have been an issue on my
>side).
>I'm far from an expert in nginx, but isn't this an extension to the
>lua-nginx-module that we don't (explicitly) have in Buildroot? Is it in
>any way useful without it?
>What is your use case for it?
>-- 
>Bye, Peter Korsgaard
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170505/ce29f82e/attachment.html>
