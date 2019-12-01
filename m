From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Dec 2019 19:16:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/jasper: bump to 2.0.16
In-Reply-To: <20191127094055.14977-1-jubalh@iodoru.org> (Michael Vetter's
 message of "Wed, 27 Nov 2019 10:40:55 +0100")
References: <20191127094055.14977-1-jubalh@iodoru.org>
Message-ID: <87zhgbq5bt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Vetter <jubalh@iodoru.org> writes:

 > Changes:
 >   * Fix assertion failure JPC_NOMINALGAIN (CVE-2016-9396) (#50)
 >   * Fix build on Windows 10 (#162)
 >   * Improve README
 >   * Fix build with CMake 2.x
 >   * Add missing dereference operators (#178, #157)
 >   * Check data in jas_image (CVE-2018-19539) (#196)
 > Signed-off-by: Michael Vetter <jubalh@iodoru.org>
 > ---
 >  DEVELOPERS                 | 3 +++
 >  package/jasper/jasper.hash | 2 +-
 >  package/jasper/jasper.mk   | 2 +-
 >  3 files changed, 5 insertions(+), 2 deletions(-)

Committed, thanks.

-- 
Bye, Peter Korsgaard
