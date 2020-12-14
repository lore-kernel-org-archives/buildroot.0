From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Dec 2020 15:44:42 +0100
Subject: [Buildroot] [PATCH] package/mosquitto: bump version to 2.0.0
In-Reply-To: <20201206104805.13543-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 6 Dec 2020 11:48:05 +0100")
References: <20201206104805.13543-1-peter@korsgaard.com>
Message-ID: <87sg88xx9h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > A new major version, see the announcement for details:
 > https://mosquitto.org/blog/2020/12/version-2-0-0-released/

 > License has now changed to v2.0 of the Eclipse Public License, so update the
 > license info and hashes to match.

 > There is now optional cJSON support, so handle that.

 > Add upstream post-2.0.0 patches fixing build with cJSON and without TLS
 > support.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
