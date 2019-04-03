From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Apr 2019 22:16:38 +0200
Subject: [Buildroot] [PATCH 2/2] package/lunit: remove it
In-Reply-To: <20190403130609.14927-2-francois.perrad@gadz.org> (Francois
 Perrad's message of "Wed, 3 Apr 2019 15:06:09 +0200")
References: <20190403130609.14927-1-francois.perrad@gadz.org>
 <20190403130609.14927-2-francois.perrad@gadz.org>
Message-ID: <874l7eg7yx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > it was replaced by its fork lunitx which supports all versions of Lua
 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 > ---
 >  Config.in.legacy         |  8 ++++++++
 >  package/Config.in        |  1 -
 >  package/lunit/Config.in  | 11 -----------
 >  package/lunit/lunit.hash |  3 ---
 >  package/lunit/lunit.mk   | 11 -----------
 >  5 files changed, 8 insertions(+), 26 deletions(-)

You forgot to remove the reference in DEVELOPERS, so now get-developers
complains about it.

I've pushed a commit to fix that.

-- 
Bye, Peter Korsgaard
