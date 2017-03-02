From: ren_guo <ren_guo@c-sky.com>
Date: Thu, 2 Mar 2017 09:00:27 +0800
Subject: [Buildroot] [PATCH 1/1] csky: Add new architecture
In-Reply-To: <1b4215f6-b664-8778-9ffb-e9b9739743d5@mind.be>
References: <1488357224-5141-1-git-send-email-ren_guo@c-sky.com>
 <1b4215f6-b664-8778-9ffb-e9b9739743d5@mind.be>
Message-ID: <527c7844-c673-e0c9-0824-ce94c7957a2c@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi, Arnout

>   If the toolchain you pull from github is more or less stable, you could also
> opt to add it to toolchain/toolchain-external, so it is easier to fetch it.

Currently I just use BR2_TOOLCHAIN_EXTERNAL_URL, and I will do this next time.

>   BTW, note that you will need to depend on BR2_HOSTARCH = "x86_64" for these
> external toolchains.

BR2_HOSTARCH is important for me, thx :)

BTW, I've changed gcc PKGVERSION to match the regax in helper.mk, it solved :)

Best Regards

guoren
