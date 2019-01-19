From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 19 Jan 2019 22:35:10 +0100
Subject: [Buildroot] [PATCH 1/2] Revert "package/php: fix building pcre
 extension"
In-Reply-To: <20190116210016.22121-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 16 Jan 2019 22:00:15 +0100")
References: <20190116210016.22121-1-fontaine.fabrice@gmail.com>
Message-ID: <87r2d81gc1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This reverts commit 745f884e41b5f350296e8448f5fc31d20f67a077.
 > This was the wrong fix: issue is that php moves from pcre to pcre2 since
 > version 7.3.0 and
 > http://github.com/php/php-src/commit/a5bc5aed71f7a15f14f33bb31b8e17bf5f327e2d

 > This patch will always disable external pcre2 support and raise a build
 > failure when toolchaine does not have pthread

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
