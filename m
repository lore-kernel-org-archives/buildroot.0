From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Jul 2013 12:59:08 +0200
Subject: [Buildroot] [PATCH v2] Makefile: Symlink lib32 to lib for
 MIPS64/n32
In-Reply-To: <CAAXf6LXK+7zWMGYd8n-kM5yNEE8YqTm30XGJD6A3zdd0nnBE5Q@mail.gmail.com>
References: <1372856816-12493-1-git-send-email-markos.chandras@gmail.com>
 <CAAXf6LXK+7zWMGYd8n-kM5yNEE8YqTm30XGJD6A3zdd0nnBE5Q@mail.gmail.com>
Message-ID: <20130711125908.55bcb3b3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 11 Jul 2013 11:24:51 +0200, Thomas De Schampheleire wrote:

> We are doing a similar thing from our post-build script, on a
> Cavium-based MIPS64 n32 ABI, so I'm definitely in favor of this patch.
> 
> I'm not sure though if the $(BUILD_DIR)/.root rule is the best place
> to put this, it seems a bit odd in my opinion.

This thing is really toolchain related, so I believe it should be the
responsibility of the respective toolchain backends to take care of
this, whenever needed.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
