From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Feb 2021 18:28:32 +0100
Subject: [Buildroot] [PATCH 4/5] package/binutils: drop 2.33.x series
In-Reply-To: <20210131223304.1857838-4-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 31 Jan 2021 23:33:02 +0100")
References: <20210131223304.1857838-1-thomas.petazzoni@bootlin.com>
 <20210131223304.1857838-4-thomas.petazzoni@bootlin.com>
Message-ID: <87ft2fn1dr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Now that 2.36.x has been added, that 2.35.x is the default version,
 > drop support for 2.33.x.

 > Note that we keep binutils 2.32.x as it is the latest version that
 > works for FLAT binaries (used on noMMU platforms).

:/ Does upstream know about this? Do they not care?

Committed, thanks.

-- 
Bye, Peter Korsgaard
