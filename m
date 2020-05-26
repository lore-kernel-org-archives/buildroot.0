From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 May 2020 11:24:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/libssh2: fix autoreconf comment
In-Reply-To: <20200516161140.21831-1-danomimanchego123@gmail.com> (Danomi
 Manchego's message of "Sat, 16 May 2020 12:11:40 -0400")
References: <20200516161140.21831-1-danomimanchego123@gmail.com>
Message-ID: <87mu5vgib5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 > The comment explaining the autoreconf says that we are building from a git
 > clone - but we are not, currently.  However, the reconf is still needed due
 > to patches modifying ac files.

 > This commit corrects the comment.

 > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
