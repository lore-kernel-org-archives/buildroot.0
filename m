From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Aug 2018 22:41:35 +0200
Subject: [Buildroot] [PATCH 5/5 v2] package/attr: bump version
In-Reply-To: <166f3279947186301770fa28116bb6d288ee8601.1530368468.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 30 Jun 2018 16:21:27 +0200")
References: <cover.1530368468.git.yann.morin.1998@free.fr>
 <166f3279947186301770fa28116bb6d288ee8601.1530368468.git.yann.morin.1998@free.fr>
Message-ID: <87sh34zugw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The current version of attr uses a canned custom buildsystem, that
 > is borked in quite a few ways (no support for static, overwrites
 > destination files without unlinking...)

 > There has been a release recently-ish, with a complete overhaul of
 > the buildsystem. We can now drop all our patches.

 > The option to disable NLS has changed, so update accordingly.

 > Fixes: #10986

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Yegor Yefremov <yegorslists@googlemail.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
