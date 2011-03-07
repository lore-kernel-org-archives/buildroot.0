From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Mar 2011 14:43:45 +0100
Subject: [Buildroot] Applying custom kernel patches
In-Reply-To: <9AC3F0E75060224C8BBC5BA2DDC8853A1F734F5E@EXV1.corp.adtran.com>
References: <AANLkTi=_dHFneTLXe3+P1-cOM2dsLsQW6f_fgbK7hSQy@mail.gmail.com>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1F734F29@EXV1.corp.adtran.com>
	<AANLkTikLN+Pr2+Stg_mb2fDvEZrRtHO9A_W14Xjd_=o3@mail.gmail.com>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1F734F5E@EXV1.corp.adtran.com>
Message-ID: <20110307144345.4f4d72f7@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 4 Mar 2011 16:13:42 -0600
ANDY KENNEDY <ANDY.KENNEDY@adtran.com> wrote:

> You should create a directory OUTSIDE the scope of the BuildRoot dirs
> for your patches.

Not necessarly. When I have board/project specific patches, I just put
them into :

	board/<manufacturer>/<boardname>/

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
