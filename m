From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 22:24:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/xorriso: fix host option
In-Reply-To: <20201115215530.553826-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 15 Nov 2020 22:55:30 +0100")
References: <20201115215530.553826-1-fontaine.fabrice@gmail.com>
Message-ID: <87pn4d2dxf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > --disable-bzip2 is not a recognized option so replace it by
 > --disable-libbz2

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
