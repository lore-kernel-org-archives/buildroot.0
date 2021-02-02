From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Feb 2021 16:34:49 +0100
Subject: [Buildroot] [PATCH] package/privoxy: security bump to version
 3.0.31
In-Reply-To: <20210201124848.9388-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 1 Feb 2021 13:48:47 +0100")
References: <20210201124848.9388-1-peter@korsgaard.com>
Message-ID: <87pn1ijxeu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > From the announcement:
 > ChangeLog for Privoxy 3.0.31
 > --------------------------------------------------------------------
 > - Security/Reliability:
 >   - Prevent an assertion from getting triggered by a crafted CGI request.
 >     Commit 5bba5b89193fa. OVE-20210130-0001.
 >     Reported by: Joshua Rogers (Opera)
 >   - Fixed a memory leak when decompression fails "unexpectedly".
 >     Commit f431d61740cc0. OVE-20210128-0001.

 > - Bug fixes:
 >   - Fixed detection of insufficient data for decompression.
 >     Previously Privoxy could try to decompress a partly
 >     uninitialized buffer.

 > https://www.privoxy.org/announce.txt

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
