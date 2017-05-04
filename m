From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 04 May 2017 23:02:59 +0200
Subject: [Buildroot] [git commit] lua-resty-http: new package
In-Reply-To: <20170504202355.59D7A826D5@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Thu, 4 May 2017 22:23:19 +0200")
References: <20170504202355.59D7A826D5@busybox.osuosl.org>
Message-ID: <87ziestjwc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=e88995f065986dc56ce5a7c222f7a9f6cbff2b94
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Signed-off-by: Semyon Kolganov <semenak94@mail.ru>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  DEVELOPERS                                 |  1 +
 >  package/Config.in                          |  1 +
 >  package/lua-resty-http/Config.in           |  6 ++++++
 >  package/lua-resty-http/lua-resty-http.hash |  2 ++
 >  package/lua-resty-http/lua-resty-http.mk   | 12 ++++++++++++
 >  5 files changed, 22 insertions(+)

 > +++ b/package/lua-resty-http/Config.in
 > @@ -0,0 +1,6 @@
 > +config BR2_PACKAGE_LUA_RESTY_HTTP
 > +	bool "lua-resty-http"
 > +	help
 > +	  Lua HTTP client cosocket driver for OpenResty / ngx_lua.
 > +
 > +	  http://github.com/pintsized/lua-resty-http

Sorry for the slow response, but this patch apparently never made it to
my mailbox? (It is in the archive, so it must have been an issue on my
side).

I'm far from an expert in nginx, but isn't this an extension to the
lua-nginx-module that we don't (explicitly) have in Buildroot? Is it in
any way useful without it?

What is your use case for it?

-- 
Bye, Peter Korsgaard
