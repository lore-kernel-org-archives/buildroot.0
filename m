From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 14 Jan 2014 09:55:04 +0100
Subject: [Buildroot] [pkg-luarocks infra v7 00/15] a package
	infrastructure for Lua modules
In-Reply-To: <CAB0FRsuRzCzf9X1yV2PKcE8Emv+EVt01FmZ=+Y0muDUAf6E7AQ@mail.gmail.com>
 (=?utf-8?Q?=22Fran=C3=A7ois?= Perrad"'s message of "Tue, 14 Jan 2014
 09:51:43 +0100")
References: <1389454937-13494-1-git-send-email-francois.perrad@gadz.org>
 <87iotnzfp4.fsf@dell.be.48ers.dk>
 <CAB0FRsuRzCzf9X1yV2PKcE8Emv+EVt01FmZ=+Y0muDUAf6E7AQ@mail.gmail.com>
Message-ID: <871u0bymc7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fran?ois" == Fran?ois Perrad <francois.perrad@gadz.org> writes:

 > 2014/1/13 Peter Korsgaard <jacmet@uclibc.org>:
 >>>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:
 >> 
 >> > Changes v6 -> v7:
 >> >   - luarocks 2.1.2 which requires no patch
 >> >   - bump and convert more Lua modules
 >> 
 >> > Francois Perrad (15):
 >> >   luainterpreter: create virtual package
 >> >   luajit: allow to build Lua extensions without lua
 >> >   lua*: restore version in module paths
 >> >   luarocks: new package
 >> >   luarocks: new infrastructure
 >> >   lua-cjson: restore official name
 >> >   luasql-sqlite3: renamed like with LuaRocks
 >> >   lua*: refactor with luarocks infrastructure
 >> >   manual: adding packages luarocks
 >> >   luasocket: bump to version 3.0-rc1
 >> >   coxpcall: bump to version 1.14.0
 >> >   copas: bump to version 1.2.1
 >> >   rings: bump to version 1.3.0

 > Peter,

 > you miss this one : `rings`, see
 > http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/74131

Sorry about that, committed now - Thanks.

-- 
Bye, Peter Korsgaard
