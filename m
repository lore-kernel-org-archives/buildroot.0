From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Mar 2021 23:13:05 +0100
Subject: [Buildroot] [PATCH 3/3] package/openblas: respect the
 optimization level specified by Buildroot
In-Reply-To: <20210305134839.30612-3-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Fri, 5 Mar 2021 14:48:38 +0100")
References: <20210305134839.30612-1-patrickdepinguin@gmail.com>
 <20210305134839.30612-3-patrickdepinguin@gmail.com>
Message-ID: <87wnu6ycge.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > openblas internally sets -O2, after the flags being passed by Buildroot
 > (e.g. -Os).

 > Patch openblas to let the Buildroot-specified flag survives.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
