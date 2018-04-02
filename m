From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Apr 2018 17:45:37 +0200
Subject: [Buildroot] [PATCH 4/8] package: share downloaded files for big
 packages
In-Reply-To: <20180402145802.17611-4-maxime.hadjinlian@gmail.com> (Maxime
 Hadjinlian's message of "Mon, 2 Apr 2018 16:57:58 +0200")
References: <20180402145802.17611-1-maxime.hadjinlian@gmail.com>
 <20180402145802.17611-4-maxime.hadjinlian@gmail.com>
Message-ID: <87woxplihq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Theses packages are given as an example of the use of the *_DL_SUBDIR feature.
 > There maybe other packages that would benefit from that feature, they
 > would need to be added on a case by case basis.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 > v4 -> v5:
 >     - Change SAME_SOURCE_AS into DL_SUBDIR

Committed, thanks.

-- 
Bye, Peter Korsgaard
