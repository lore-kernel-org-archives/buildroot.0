From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 07 Jan 2021 20:34:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/jasper: Bump to 2.0.24
In-Reply-To: <20210104093345.32352-1-jubalh@iodoru.org> (Michael Vetter's
 message of "Mon, 4 Jan 2021 10:33:45 +0100")
References: <20210104093345.32352-1-jubalh@iodoru.org>
Message-ID: <87h7nszglc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Vetter <jubalh@iodoru.org> writes:

 > Changes:
 > * Add JAS_VERSION_MAJOR, JAS_VERSION_MINOR, JAS_VERSION_PATCH for
 >   easier access to the JasPer version.
 > * Fixes stack overflow bug on Windows, where variable-length
 >   arrays are not available. (#256)

 > Signed-off-by: Michael Vetter <jubalh@iodoru.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
