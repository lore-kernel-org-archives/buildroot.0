From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Oct 2019 21:18:55 +0200
Subject: [Buildroot] [PATCH 1/5] core: drop check-uniq-files
In-Reply-To: <491a494cfc299c0335355e57d0c1bd4c74ab9ed0.1572101547.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 26 Oct 2019 16:53:20 +0200")
References: <cover.1572101547.git.yann.morin.1998@free.fr>
 <491a494cfc299c0335355e57d0c1bd4c74ab9ed0.1572101547.git.yann.morin.1998@free.fr>
Message-ID: <87d0eje2n4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Back a few years ago, when we were starting to think about top-level
 > parallel build, we were not sure how to deal with packages that
 > installed the same files, so we wanted to catch the situation to assess
 > how prevalent that was, before we decided what to do and how to address
 > it.

 > However, the trend nowadays is that packages will install in a
 > per-package target/ (and staging/ and host/), and the final directories
 > willi be assembled in a reproducible (alphabetical) order, so if two
 > packages install the same file, the last one will win (as is currently
 > the case).

 > Besides, check-uniq-files reports loads of spurious errors when packages
 > get reinstalled (e.g. during development).

 > Finally, check-uniq-files is the only script called during the build,
 > that is written in python.

 > So, get rid of check-uniq-files.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
