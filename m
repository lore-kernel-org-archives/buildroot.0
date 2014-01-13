From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 Jan 2014 23:20:55 +0100
Subject: [Buildroot] [pkg-luarocks infra v7 00/15] a package
	infrastructure for Lua modules
In-Reply-To: <1389454937-13494-1-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Sat, 11 Jan 2014 16:42:02 +0100")
References: <1389454937-13494-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <87iotnzfp4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Changes v6 -> v7:
 >   - luarocks 2.1.2 which requires no patch
 >   - bump and convert more Lua modules

 > Francois Perrad (15):
 >   luainterpreter: create virtual package
 >   luajit: allow to build Lua extensions without lua
 >   lua*: restore version in module paths
 >   luarocks: new package
 >   luarocks: new infrastructure
 >   lua-cjson: restore official name
 >   luasql-sqlite3: renamed like with LuaRocks
 >   lua*: refactor with luarocks infrastructure
 >   manual: adding packages luarocks
 >   luasocket: bump to version 3.0-rc1
 >   coxpcall: bump to version 1.14.0
 >   copas: bump to version 1.2.1
 >   rings: bump to version 1.3.0
 >   wsapi: bump to version 1.6
 >   xavante: bump to version 2.3.0

Committed series, thanks!

-- 
Bye, Peter Korsgaard
