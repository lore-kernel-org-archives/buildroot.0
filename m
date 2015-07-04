From: Mike <mikez@OpenPlayer.org>
Date: Sat, 4 Jul 2015 12:54:35 -0500
Subject: [Buildroot] Question on the Auto-builder
Message-ID: <20150704125435.47827cda@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Are the auto-builders set up so that once they 
select either Lua or LuaJIT, they also select
some (or all) of the modules.

Well, with the exception of the modules than
are not intended to work with LuaJIT of course.

(I.E: lua-bitop, since its built-in.)

Mike
