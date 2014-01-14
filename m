From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 14 Jan 2014 09:51:43 +0100
Subject: [Buildroot] [pkg-luarocks infra v7 00/15] a package
 infrastructure for Lua modules
In-Reply-To: <87iotnzfp4.fsf@dell.be.48ers.dk>
References: <1389454937-13494-1-git-send-email-francois.perrad@gadz.org>
 <87iotnzfp4.fsf@dell.be.48ers.dk>
Message-ID: <CAB0FRsuRzCzf9X1yV2PKcE8Emv+EVt01FmZ=+Y0muDUAf6E7AQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014/1/13 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:
>
>  > Changes v6 -> v7:
>  >   - luarocks 2.1.2 which requires no patch
>  >   - bump and convert more Lua modules
>
>  > Francois Perrad (15):
>  >   luainterpreter: create virtual package
>  >   luajit: allow to build Lua extensions without lua
>  >   lua*: restore version in module paths
>  >   luarocks: new package
>  >   luarocks: new infrastructure
>  >   lua-cjson: restore official name
>  >   luasql-sqlite3: renamed like with LuaRocks
>  >   lua*: refactor with luarocks infrastructure
>  >   manual: adding packages luarocks
>  >   luasocket: bump to version 3.0-rc1
>  >   coxpcall: bump to version 1.14.0
>  >   copas: bump to version 1.2.1
>  >   rings: bump to version 1.3.0

Peter,

you miss this one : `rings`, see
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/74131

Fran?ois


>  >   wsapi: bump to version 1.6
>  >   xavante: bump to version 2.3.0
>
> Committed series, thanks!
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
