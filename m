From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 16:27:08 +0200
Subject: [Buildroot] [PATCH 1/2] package/attr: fix install
In-Reply-To: <f9d865c95abc99fb0a3bf44829aff63f6f995ac2.1525786905.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 8 May 2018 15:42:01 +0200")
References: <cover.1525786905.git.yann.morin.1998@free.fr>
 <f9d865c95abc99fb0a3bf44829aff63f6f995ac2.1525786905.git.yann.morin.1998@free.fr>
Message-ID: <87r2lvx3cz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Do not overwrite destination file if it exists.
 > Fixes: #10986

 > Reported-by: mzweerspenko+bugzilla at gmail.com
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: mzweerspenko+bugzilla at gmail.com

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
