From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Jan 2011 23:28:58 +0100
Subject: [Buildroot] [PATCH 3/4] Makefile: generate CMake toolchain file
 in $(O)
In-Reply-To: <AANLkTimq86Kw6oCyacEhwE+YpcQa4H8etr49hCAyNz4y@mail.gmail.com>
References: <1292182155-29576-1-git-send-email-bjorn.forsman@gmail.com>
	<1292182155-29576-4-git-send-email-bjorn.forsman@gmail.com>
	<20110107181536.53713c9a@surf> <20110110185013.331f5af1@surf>
	<AANLkTimq86Kw6oCyacEhwE+YpcQa4H8etr49hCAyNz4y@mail.gmail.com>
Message-ID: <20110110232858.517b3e42@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 10 Jan 2011 19:30:16 +0100
Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:

> Yes, I'll add that, thanks! I guess it only matters for the target build and
> not native build (we don't strip HOST_DIR do we?), but I think I'll add
> it to native build anyway, for consistency.

Yes, it really only matters for the target build, but as most of
the .so in $(HOST_DIR) are also installed with executable permissions,
it's probably ok to set this variable to 0 as well for host builds.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
