From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 07 Feb 2020 15:55:09 +0100
Subject: [Buildroot] [PATCH 2/2] package/wireguard-tools: bump to
 version 1.0-20200206
In-Reply-To: <20200206222107.31981-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 6 Feb 2020 23:21:06 +0100")
References: <20200206222107.31981-1-peter@korsgaard.com>
 <20200206222107.31981-2-peter@korsgaard.com>
Message-ID: <87o8uawipe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Drop libmnl dependency. From the announcement:
 >  * netlink: remove libmnl requirement

 > We no longer require libmnl.  It turns out that inlining the small subset of
 > libmnl that we actually use results in a smaller binary than the overhead of
 > linking to the external library.

 > pkg-config is still used for the systemd support though, so move the
 > host-pkgconf dependency there.

 > For more details, see the announcement:

 > https://lists.zx2c4.com/pipermail/wireguard/2020-February/004963.html

 > While we are at it, adjust the white space in the .hash file to match the
 > new agreements.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
