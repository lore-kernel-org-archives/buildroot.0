From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 16:27:03 +0200
Subject: [Buildroot] [PATCH 2/2] package/ac: fix install
In-Reply-To: <8b860ca93d0672e9d84d2321027f425fce34181d.1525786906.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 8 May 2018 15:42:02 +0200")
References: <cover.1525786905.git.yann.morin.1998@free.fr>
 <8b860ca93d0672e9d84d2321027f425fce34181d.1525786906.git.yann.morin.1998@free.fr>
Message-ID: <87vab7x3d4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Do not overwrite destination file if it exists.
 > Simliar to bug #10986.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: mzweerspenko+bugzilla at gmail.com

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
