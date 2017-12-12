From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Dec 2017 09:31:29 +0100
Subject: [Buildroot] [PATCH] gnupg: add host package
In-Reply-To: <20171211170429.25644-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 11 Dec 2017 18:04:29 +0100")
References: <20171211170429.25644-1-peter@korsgaard.com>
Message-ID: <877etsuz32.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > For E.G. post-build / post-image scripts as it generally cannot be expected
 > to be available on the build host and/or there are some differences in
 > behaviour between gnupg 1.x / 2.x.

 > Provide gnupg 1.x instead of 2.x, as it is simpler to build (less
 > dependencies) and easier to use in post-build / post-image scripts (E.G. no
 > gpg-agent that keeps running in the background).

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
