From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 20 Sep 2013 15:34:30 +0200
Subject: [Buildroot] [PATCH v2 01/17] libsepol: new package
In-Reply-To: <1378936777-28308-2-git-send-email-clshotwe@rockwellcollins.com>
 (Clayton Shotwell's message of "Wed, 11 Sep 2013 16:59:21 -0500")
References: <1378936777-28308-1-git-send-email-clshotwe@rockwellcollins.com>
 <1378936777-28308-2-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <87y56rbord.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Clayton" == Clayton Shotwell <clshotwe@rockwellcollins.com> writes:

 Clayton> Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
 Clayton> ---
 Clayton> Changes v1 -> v2:
 Clayton>   - Move Config.in entry into the libraries section since this is a
 Clayton>     library.
 Clayton>   - General cleanup to the mk file to conform to the standard format.
 Clayton>   - Fixed the license version to be LGPLv2.1+ to match the headers in
 Clayton>     the source files (suggested by Thomas)

Committed with some minor whitespace fixes, thanks.

-- 
Bye, Peter Korsgaard
