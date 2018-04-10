From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Apr 2018 22:46:30 +0200
Subject: [Buildroot] [PATCH master 1/1] jq: compile as _GNU_SOURCE to
 fix segfault after compilation with gcc 6
In-Reply-To: <20180219155734.31427-1-thomas.de_schampheleire@nokia.com>
 (Thomas De Schampheleire's message of "Mon, 19 Feb 2018 16:57:34
 +0100")
References: <20180219155734.31427-1-thomas.de_schampheleire@nokia.com>
Message-ID: <878t9u6b89.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <thomas.de_schampheleire@nokia.com> writes:

 > When compiling host-jq with gcc 6+, running it gives an immediate segfault.
 > Reported upstream: https://github.com/stedolan/jq/issues/1598

 > The issue can be solved by compiling with _GNU_SOURCE as extra preprocessor
 > define. Once the issue is solved upstream, this change can be reverted.

 > As the issue will normally be the same for target, apply the same fix there.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
