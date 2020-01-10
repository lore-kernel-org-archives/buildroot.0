From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Jan 2020 12:15:50 +0100
Subject: [Buildroot] [PATCH 1/2] package/toolchain-external: ensure
 ARCH_LIB_DIR exist
In-Reply-To: <CAAXf6LUVA4QkSmz8OaSOyqzKaw--eD5r0zAD+zONfyGROv1MZw@mail.gmail.com>
References: <1577937441-18703-1-git-send-email-han_mao@c-sky.com>
 <CAAXf6LUVA4QkSmz8OaSOyqzKaw--eD5r0zAD+zONfyGROv1MZw@mail.gmail.com>
Message-ID: <20200110121550.36c1aba9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 Jan 2020 11:57:00 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> Finally, please provide a defconfig that allows to reproduce and test
> this problem.

I agree that we need to have access to the toolchain causing problems,
so that we can understand better what are the issues, and what is the
best solution to solve them.

This would also ideally allow to add a test case in Buildroot for this
toolchain, to make sure it keeps working moving forward.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
