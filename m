From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Mar 2021 23:55:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/jasper: bump version to 2.0.27
In-Reply-To: <20210318113327.829-1-jubalh@iodoru.org> (Michael Vetter's
 message of "Thu, 18 Mar 2021 12:33:27 +0100")
References: <20210318113327.829-1-jubalh@iodoru.org>
Message-ID: <87im5gkvqu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Vetter <jubalh@iodoru.org> writes:

 > Changes:
 >   * Check for an image containing no samples in the PGX
 >     decoder. (#271, #272, #273, #274, #275, #276, #281)
 >   * Check for dimensions of zero in the JPC and JPEG decoders.
 >   * Fix an arguably incorrect type for an integer literal
 >     in the PGX decoder. (#270)
 >   * Check for an invalid component reference in the
 >     JP2 decoder. (#269)
 >   * Check on integer size in JP2 decoder. (#278)

 > Signed-off-by: Michael Vetter <jubalh@iodoru.org>

Committed to 2021.02.x given the fixes, thanks.

-- 
Bye, Peter Korsgaard
