From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Mar 2019 10:35:37 +0100
Subject: [Buildroot] [PATCH 1/3] package/owfs: drop unneeded first patch
In-Reply-To: <20190324221019.10193-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 24 Mar 2019 23:10:17 +0100")
References: <20190324221019.10193-1-fontaine.fabrice@gmail.com>
Message-ID: <87bm1vnxxy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Patch is not needed since version 3.1p2 and
 > https://github.com/owfs/owfs/commit/2982df8ca648bd9cec4d820151046b044ef504e0
 > because localtime_r is now correctly checked

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
