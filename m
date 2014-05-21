From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 May 2014 10:38:36 +0200
Subject: [Buildroot] [PATCH] toolchain-external: fix Linaro 2014.02
	symlink
In-Reply-To: <1400658722-31343-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 21 May 2014 09:52:02 +0200")
References: <1400658722-31343-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87d2f7frw3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > In commit cd32da8f7931af61737df293d1f8bcedaab8648e
 > ("toolchain-external: add Linaro ARM big endian toolchain") a mistake
 > was made, probably due to a rebase conflict that was incorrect solved:
 > the call to the post install staging hook that creates the necessary
 > symbolic links for a root filesystem based on Linaro 2014.02 to work
 > was removed.

 > This commit reinstates this call, which should fix the problem
 > observed by Maxime Hadjinlian while using Linaro 2014.02.

 > Reported-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed with 's/incorrect/incorrectly/, thanks.

-- 
Bye, Peter Korsgaard
