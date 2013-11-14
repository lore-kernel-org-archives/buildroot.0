From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Nov 2013 15:26:32 +0100
Subject: [Buildroot] [pkg-luarocks infra V2 07/10] lua-cjson: restore
 official name
In-Reply-To: <CANxTyt5xiK0GwtOWPiL2L4OecVRKVVrsUVexyG0cUwjnyJ8tOA@mail.gmail.com>
References: <1384436996-25525-1-git-send-email-francois.perrad@gadz.org>
 <1384436996-25525-8-git-send-email-francois.perrad@gadz.org>
 <CANxTyt5xiK0GwtOWPiL2L4OecVRKVVrsUVexyG0cUwjnyJ8tOA@mail.gmail.com>
Message-ID: <20131114152632.1e2b5ab7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Thu, 14 Nov 2013 09:15:02 -0500, Danomi Manchego wrote:

> If you must rename "luacjson" to "lua-cjson", then should not
> "luacjson" be added to the "Legacy config options" menu, to warn
> anyone using luacjson (like me)?
> 
> Same comment for "luasql" and "luasql-sqlite3" ...

Indeed, the relevant Config.in.legacy options should be added.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
