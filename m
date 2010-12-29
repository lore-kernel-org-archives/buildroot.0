From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Dec 2010 11:57:33 +0100
Subject: [Buildroot] oprofile "requires" gmp??? Slight fork:
 BR2_STAGING_DIR
In-Reply-To: <4D1A54D6.60805@zacarias.com.ar>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1EA26053@EXV1.corp.adtran.com>
	<20101223082740.3a8e44c4@surf>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1EA263BF@EXV1.corp.adtran.com>
	<20101224090517.0c935c19@surf>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1EA2689B@EXV1.corp.adtran.com>
	<4D18D7B3.3020900@zacarias.com.ar>
	<4D18D873.9010502@zacarias.com.ar>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1EAEB132@EXV1.corp.adtran.com>
	<4D19E079.9030704@zacarias.com.ar>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1EAEB2EA@EXV1.corp.adtran.com>
	<4D1A54D6.60805@zacarias.com.ar>
Message-ID: <20101229115733.55dc9bd2@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Dec 2010 18:21:26 -0300
Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:

> I was about to say that we can keep a symlink from staging->sysroot
> but i'd rather watch it die because i can't think of any useful
> purpose where people can't use the computed $(STAGING_DIR) directly.

I think we should keep such a symbolic link, at least at the beginning.
It'll allow users to notice that staging/ still exists, but has moved
to another place.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
