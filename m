From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 23:21:13 +0200
Subject: [Buildroot] [PATCH 1/2 v2] spport/check-bin-arch: accept
 arbitrary ignore paths
In-Reply-To: <161df6edb84bab2b76a3b9ae0527e479674b1be8.1520459473.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 7 Mar 2018 22:51:23 +0100")
References: <cover.1520459473.git.yann.morin.1998@free.fr>
 <161df6edb84bab2b76a3b9ae0527e479674b1be8.1520459473.git.yann.morin.1998@free.fr>
Message-ID: <87h8ox1cqe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Some packages (mostly, out-of-tree) may want to install binary blobs for
 > another architecture,  outside the locations we currently exclude, like
 > in /opt or whatever...

 > Add support in check-bin-arch to accept any arbitrary location, that
 > individual package can each request to excude from the check, when they
 > are installed.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

 > ---
 > Changes v1 -> v2:
 >   - typoes and rephrasing  (Peter)
 >   - use intermediate variable to cleanup the ignore option  (Thomas)

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
