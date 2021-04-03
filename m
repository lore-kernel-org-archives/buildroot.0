From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Apr 2021 11:05:36 +0200
Subject: [Buildroot] [PATCH 2/2] Revert "package/mpd: fix build of
 GenParseName"
In-Reply-To: <20210323163051.1284416-2-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Tue, 23 Mar 2021 17:30:51 +0100")
References: <20210323163051.1284416-1-joerg.krause@embedded.rocks>
 <20210323163051.1284416-2-joerg.krause@embedded.rocks>
Message-ID: <877dlj91r3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > This reverts commit 9783c04aaf5e4fc94099772f1dc699a974ee6538.
 > This commit is actually a workaround to get Meson passing `-libstdc++`
 > to the C linker. The correct fix is to pass the host C++ compiler to
 > Meson instead of the host C compiler using the `CXX_FOR_BUILD` variable.

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
