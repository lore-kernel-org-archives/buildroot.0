From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Dec 2019 22:37:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/jasper: bump to 2.0.16
In-Reply-To: <20191127094055.14977-1-jubalh@iodoru.org> (Michael Vetter's
 message of "Wed, 27 Nov 2019 10:40:55 +0100")
References: <20191127094055.14977-1-jubalh@iodoru.org>
Message-ID: <87blsmpi6t.fsf@dell.be.48ers.dk>
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

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
