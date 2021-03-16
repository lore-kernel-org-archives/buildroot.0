From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Mar 2021 23:12:59 +0100
Subject: [Buildroot] [PATCH 2/3] package/openblas: strip any
 optimization flag where needed
In-Reply-To: <20210305134839.30612-2-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Fri, 5 Mar 2021 14:48:37 +0100")
References: <20210305134839.30612-1-patrickdepinguin@gmail.com>
 <20210305134839.30612-2-patrickdepinguin@gmail.com>
Message-ID: <871rcezr10.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > openblas strips off -O1-O3 for certain source files, but forgets to handle
 > -Os, -Og and -O. This means that the intended effect of 'no optimization' is
 > not always reached.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
