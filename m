From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Jul 2017 21:32:03 +0200
Subject: [Buildroot] [PATCH] mosquitto: bump version to 1.4.14
In-Reply-To: <20170711095713.8258-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 11 Jul 2017 11:57:13 +0200")
References: <20170711095713.8258-1-peter@korsgaard.com>
Message-ID: <87r2xmsrbg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Drop CVE 2017-9868 patch as that is now upstream.
 > 1.4.14 is a bugfix release, fixing significant websocket performance /
 > correctness issues.

 > Use HTTPS for the download as the server uses HSTS, thus saving a redirect.

 > While we're at it, add hashes for the license files.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
