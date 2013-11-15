From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Nov 2013 09:20:49 +0100
Subject: [Buildroot] [pkg-luarocks infra V3 08/10] luasql-sqlite3:
 renamed like with LuaRocks
In-Reply-To: <CAAXf6LUwdsoRLR4_MV6mRQY3pf2xXvrAktkckak32D5o0KvFuw@mail.gmail.com>
References: <1384460249-32410-1-git-send-email-francois.perrad@gadz.org>
 <1384460249-32410-8-git-send-email-francois.perrad@gadz.org>
 <CAAXf6LUwdsoRLR4_MV6mRQY3pf2xXvrAktkckak32D5o0KvFuw@mail.gmail.com>
Message-ID: <20131115092049.6cfd4ab8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 15 Nov 2013 08:49:50 +0100, Thomas De Schampheleire wrote:

> How have you moved this file? I don't see any indication of a
> git-aware move, it seems to be an independent delete+add...

Regardless on how you move things (either git mv, or plain mv), git
format-patch -M should be able to detect renames. At least, that's my
understanding of the thing: git does track renames per se, but
format-patch can detect them when two files are quite similar, and then
encode the change as a rename + a small diff, rather than a full
removal + full addition.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
