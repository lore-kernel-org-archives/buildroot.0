From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Mar 2021 23:31:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/jasper: bump version to 2.0.26
In-Reply-To: <20210305154913.29414-1-jubalh@iodoru.org> (Michael Vetter's
 message of "Fri, 5 Mar 2021 16:49:13 +0100")
References: <20210305154913.29414-1-jubalh@iodoru.org>
Message-ID: <87zgzh9qs1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Vetter <jubalh@iodoru.org> writes:

 > Changes:
 > * Fix JP2 decoder bug that can cause a null pointer dereference for
 >   some invalid CDEF boxes. (#268)

 > Signed-off-by: Michael Vetter <jubalh@iodoru.org>

Committed to master given how small the diff is, thanks.

-- 
Bye, Peter Korsgaard
