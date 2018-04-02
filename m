From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Apr 2018 17:45:09 +0200
Subject: [Buildroot] [PATCH 2/8] pkg-generic: introduce _DL_SUBDIR
In-Reply-To: <20180402145802.17611-2-maxime.hadjinlian@gmail.com> (Maxime
 Hadjinlian's message of "Mon, 2 Apr 2018 16:57:56 +0200")
References: <20180402145802.17611-1-maxime.hadjinlian@gmail.com>
 <20180402145802.17611-2-maxime.hadjinlian@gmail.com>
Message-ID: <876059mx2y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > This per package variable can be used to specify the download
 > subdirectory used by that package.

 > The use case here is for example linux-headers and linux, which share
 > the same sources (because they are the same upstream project), so we
 > don't want to download twice the kernel, nor store it multiple times
 > either.

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 > v4 -> v5:
 >     - Change SAME_SOURCE_AS into DL_SUBDIR (Thomas Petazzonni)

Committed, thanks.

-- 
Bye, Peter Korsgaard
