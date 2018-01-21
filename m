From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Jan 2018 21:24:15 +0100
Subject: [Buildroot] [PATCH] toolchain/toolchain-external: libatomic
 should also be copied for musl toolchains
In-Reply-To: <20180116224808.1630-1-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 16 Jan 2018 23:48:08 +0100")
References: <20180116224808.1630-1-thomas.petazzoni@free-electrons.com>
Message-ID: <87607vc64w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > libatomic, like libgcc_s, is provided by gcc, so there is no reason to
 > copy it over only for the glibc and uclibc cases, it should also be
 > copied for the musl case. Without this, a program linked with
 > libatomic on a musl system will fail to run due to the missing
 > library.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
