From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:29:11 +0200
Subject: [Buildroot] [PATCH] package/ripgrep: fix build directories
In-Reply-To: <20200827004424.325134-1-sam.voss@gmail.com> (sam voss's message
 of "Wed, 26 Aug 2020 19:44:24 -0500")
References: <20200827004424.325134-1-sam.voss@gmail.com>
Message-ID: <87sgc6of14.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "sam" == sam voss <sam.voss@gmail.com> writes:

 > From: Sam Voss <sam.voss@gmail.com>
 > RIPGREP_CARGO_MODE was no longer defined after 832c076f26 and caused
 > issues during the install step as the build directory was malformed.

 > This patch maintains the release/dev profile distinction, while also
 > assigning appropriate build folders.

 > Fixes:
 >  - http://autobuild.buildroot.net/results/a4cd7ecc6d983aa6f15d3be1e21529f17e04b825/
 >  - http://autobuild.buildroot.net/results/2bab8ffa590d4c4eabffe94ed27311c7f6607c98/

 > Signed-off-by: Sam Voss <sam.voss@gmail.com>
 > CC: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
