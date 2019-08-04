From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Aug 2019 22:16:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/openvmtools: use tirpc when no
 toolchain RPC
In-Reply-To: <1564043421-126710-1-git-send-email-simon.rowe@citrix.com> (Simon
 Rowe's message of "Thu, 25 Jul 2019 09:30:21 +0100")
References: <1564043421-126710-1-git-send-email-simon.rowe@citrix.com>
Message-ID: <87ef20ofe4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Simon" == Simon Rowe <simon.rowe@citrix.com> writes:

 > openvmtools detects an external RPC library, select package/libtirpc
 > when necessary.

 > Signed-off-by: Simon Rowe <simon.rowe@citrix.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
