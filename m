From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Oct 2011 20:21:28 +0200
Subject: [Buildroot] [PATCH 4/5] xdata_xcursor-themes: add dependency on
	host xapp_xcursorgen
In-Reply-To: <e47afdf2949613e71f9b1602152a76c4d0db4715.1316465857.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 19 Sep 2011 22:57:40 +0200")
References: <cover.1316465857.git.thomas.petazzoni@free-electrons.com>
 <cover.1316465857.git.thomas.petazzoni@free-electrons.com>
 <e47afdf2949613e71f9b1602152a76c4d0db4715.1316465857.git.thomas.petazzoni@free-electrons.com>
Message-ID: <871uurpadz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> As reported in bug #3331, xdata_xcursor_themes needs the xcursorgen
 Thomas> application installed on the host. This commit adds this dependency,
 Thomas> together with the needed host libraries required for xapp_cursorgen to
 Thomas> build properly.

Committed with some fixups because of the AUTOTARGETS changes, thanks.

-- 
Bye, Peter Korsgaard
