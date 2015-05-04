From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 May 2015 15:37:34 +0200
Subject: [Buildroot] [PATCH 1/2 v2] docs/manual: also document md5 hash
In-Reply-To: <64ebdddcde18c7c33ca79c5afe6955b0d695b90e.1430667367.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 3 May 2015 17:37:39 +0200")
References: <cover.1430667367.git.yann.morin.1998@free.fr>
 <64ebdddcde18c7c33ca79c5afe6955b0d695b90e.1430667367.git.yann.morin.1998@free.fr>
Message-ID: <87h9rsqx9d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > We accept an md5 hash, but only if coming from upstream, and if also
 > accompanied with a stronger hash.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Cc: Samuel Martin <s.martin49@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 > ---
 > Chanves v1 -> v2:
 >   - fix merge-gone-wild  (Arnout)
 >   - clarify that we prefer sha256 for locally computed hashes  (Arnout)
 >   - make the comment in the example aligned with current customs  (Arnout)
 >   - typoes in commit log  (Arnout)

Committed, thanks.

-- 
Bye, Peter Korsgaard
