From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Dec 2019 09:03:56 +0100
Subject: [Buildroot] [PATCH 1/3] configs/friendlyarm_nanopi_neo_plus2:
 use an extlinux instead of boot.cmd
In-Reply-To: <20191209215923.28945-1-aussedat.louis@gmail.com> (Louis
 Aussedat's message of "Mon, 9 Dec 2019 22:59:21 +0100")
References: <20191209215923.28945-1-aussedat.louis@gmail.com>
Message-ID: <87o8wghaj7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Louis" == Louis Aussedat <aussedat.louis@gmail.com> writes:

 > This remove the file boot.cmd to use an extlinux.conf instead.
 > Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
 > ---
 >  board/friendlyarm/nanopi-neo-plus2/boot.cmd      | 6 ------
 >  board/friendlyarm/nanopi-neo-plus2/extlinux.conf | 4 ++++
 >  board/friendlyarm/nanopi-neo-plus2/genimage.cfg  | 2 +-
 >  board/friendlyarm/nanopi-neo-plus2/post-build.sh | 4 ++++
 >  configs/friendlyarm_nanopi_neo_plus2_defconfig   | 3 +--
 >  5 files changed, 10 insertions(+), 9 deletions(-)

This is not really any significant improvement in code size, but OK -
Committed, thanks.

-- 
Bye, Peter Korsgaard
