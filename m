From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Apr 2021 21:26:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/jasper: bump version to 2.0.28
In-Reply-To: <20210329171502.26661-1-jubalh@iodoru.org> (Michael Vetter's
 message of "Mon, 29 Mar 2021 19:15:02 +0200")
References: <20210329171502.26661-1-jubalh@iodoru.org>
Message-ID: <87o8etyhpu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Vetter <jubalh@iodoru.org> writes:

 > Changes:
 >   * Fix potential null pointer dereference in the JP2/JPC decoder. (#269)
 >   * Fix ignoring of JAS_STREAM_FILEOBJ_NOCLOSE at stream close time. (#286)
 >   * Fix integral type sizing problem in JP2 codec. (#284)
 > Signed-off-by: Michael Vetter <jubalh@iodoru.org>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
