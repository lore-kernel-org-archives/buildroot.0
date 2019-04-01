From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Apr 2019 22:11:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/vim: fix build for the host if
 NLS is disabled
In-Reply-To: <20190401214626.679bff62@windsurf> (Thomas Petazzoni's message of
 "Mon, 1 Apr 2019 21:46:26 +0200")
References: <1554124857-10946-1-git-send-email-email@gmail.com>
 <20190401214626.679bff62@windsurf>
Message-ID: <87k1gdiizr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 > However, for target packages, we are passing --enable-nls/--disable-nls
 > in the autotools-package infrastructure. Perhaps we should simply do
 > the same for host packages and always pass --disable-nls ? We have a
 > few host packages already passing --disable-nls:

..

 > Since it works for target packages, I think it should be OK to do the
 > same for host packages, no?

I would think so as well, yes.

-- 
Bye, Peter Korsgaard
