From: Anders Darander <anders.darander@gmail.com>
Date: Fri, 18 Dec 2009 08:32:00 +0100
Subject: [Buildroot] [Bug 757] U-Boot: mkimage cannot be installed using
	external toolchain
In-Reply-To: <20091209102836.8A5177776F@busybox.osuosl.org>
References: <bug-757-163@https.bugs.busybox.net/>
	<20091209102836.8A5177776F@busybox.osuosl.org>
Message-ID: <2c9a759f0912172332wb40a41fm4b79427ff40ce11d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Wed, Dec 9, 2009 at 11:28,  <bugzilla@busybox.net> wrote:
> Attached is a rebased version of the patched. It's now based on SHA1 ID:
> b7ed169692dca7a1bc423e982d37f015fc998943.
>

I'm just bumping this issue, as I've not heard anything.

Unless there are any feedback, I hope that the patch could be applied.
Or should the problem be solved in some other way?

Recap: The problem is that $(STAGING_DIR)/usr/bin, does not exist when
u-boot tries to install the mkimage binary. Thus, the installation
will fail. This occurs when using an external toolchain.

Regards,
Anders
