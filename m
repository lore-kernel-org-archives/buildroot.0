From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 16 Jun 2013 21:53:58 +0200
Subject: [Buildroot] [PATCH 05/12] lua-ev: New package
In-Reply-To: <CAB0FRsvRF=cpFEY8d7nXXz849UBMyqJJ0VmMMCjzU5rReb3Svg@mail.gmail.com>
 (=?utf-8?Q?=22Fran=C3=A7ois?= Perrad"'s message of "Mon, 20 May 2013
 18:05:06 +0200")
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
 <1369054604-26139-5-git-send-email-shmuelzon@gmail.com>
 <CAB0FRsvRF=cpFEY8d7nXXz849UBMyqJJ0VmMMCjzU5rReb3Svg@mail.gmail.com>
Message-ID: <8761xdvnl5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fran?ois" == Fran?ois Perrad <francois.perrad@gadz.org> writes:

 Fran?ois> 2013/5/20 Assaf Inbal <shmuelzon@gmail.com>

 Fran?ois>     Lua bindings for libev

 Fran?ois>     +++ b/package/lua-ev/lua-ev.mk
 Fran?ois>     @@ -0,0 +1,16 @@
 Fran?ois>     +#############################################################
 Fran?ois>     +#
 Fran?ois>     +# lua-ev
 Fran?ois>     +#
 Fran?ois>     +#############################################################
 Fran?ois>     +
 Fran?ois>     +LUA_EV_VERSION = master
 Fran?ois>     +LUA_EV_SITE = git://github.com/brimworks/lua-ev.git
 Fran?ois>     +LUA_EV_SITE_METHOD = git


 Fran?ois> master is not a fixed reference.

 Fran?ois> -LUA_EV_VERSION = master
 Fran?ois> -LUA_EV_SITE = git://github.com/brimworks/lua-ev.git
 Fran?ois> -LUA_EV_SITE_METHOD = git
 Fran?ois> +LUA_EV_VERSION = g458165b
 Fran?ois> +LUA_EV_SITE = http://github.com/brimworks/lua-ev/tarball/master

Assaf, will you send an updated patch taking the review feedback into
consideration?

-- 
Bye, Peter Korsgaard
