From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Nov 2020 23:44:57 +0100
Subject: [Buildroot] [PATCH] package/privoxy: security bump to version
 3.0.29
In-Reply-To: <20201130071244.1933-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 30 Nov 2020 08:12:43 +0100")
References: <20201130071244.1933-1-peter@korsgaard.com>
Message-ID: <87tut6zcpi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > From the release notes:
 > - Security/Reliability:
 >   - Fixed memory leaks when a response is buffered and the buffer
 >     limit is reached or Privoxy is running out of memory.
 >     Commits bbd53f1010b and 4490d451f9b. OVE-20201118-0001.
 >     Sponsored by: Robert Klemme
 >   - Fixed a memory leak in the show-status CGI handler when
 >     no action files are configured. Commit c62254a686.
 >     OVE-20201118-0002.
 >     Sponsored by: Robert Klemme
 >   - Fixed a memory leak in the show-status CGI handler when
 >     no filter files are configured. Commit 1b1370f7a8a.
 >     OVE-20201118-0003.
 >     Sponsored by: Robert Klemme
 >   - Fixes a memory leak when client tags are active.
 >     Commit 245e1cf32. OVE-20201118-0004.
 >     Sponsored by: Robert Klemme
 >   - Fixed a memory leak if multiple filters are executed
 >     and the last one is skipped due to a pcre error.
 >     Commit 5cfb7bc8fe. OVE-20201118-0005.
 >   - Prevent an unlikely dereference of a NULL-pointer that
 >     could result in a crash if accept-intercepted-requests
 >     was enabled, Privoxy failed to get the request destination
 >     from the Host header and a memory allocation failed.
 >     Commit 7530132349. CID 267165. OVE-20201118-0006.
 >   - Fixed memory leaks in the client-tags CGI handler when
 >     client tags are configured and memory allocations fail.
 >     Commit cf5640eb2a. CID 267168. OVE-20201118-0007.
 >   - Fixed memory leaks in the show-status CGI handler when memory
 >     allocations fail. Commit 064eac5fd0 and commit fdee85c0bf3.
 >     CID 305233. OVE-20201118-0008.

 > For more details, see the announcement:
 > https://www.openwall.com/lists/oss-security/2020/11/29/1

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
