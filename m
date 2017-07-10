From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 Jul 2017 13:41:13 +0200
Subject: [Buildroot] [PATCH] board: add support for nanopi-m1-plus
In-Reply-To: <CAA4kGkp6Royw9_xPoRK2Fhg8Qk5MovKUm-XNGbaFegeA31UNDA@mail.gmail.com>
 (Chakra D.'s message of "Mon, 10 Jul 2017 16:58:01 +0530")
References: <1499364298-8433-1-git-send-email-chakra@openedev.com>
 <20170706212626.0abcaf57@windsurf.lan>
 <CAA4kGkp6Royw9_xPoRK2Fhg8Qk5MovKUm-XNGbaFegeA31UNDA@mail.gmail.com>
Message-ID: <87tw2ktt7q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chakra" == Chakra D <2chakrass@gmail.com> writes:

Hi,

 >> Also, please put this patch in:
 >> 
 >> board/friendlyarm/nanopi-m1-plus/linux/patches/
 >> 
 >> and name it just 0001-<something>.patch (i.e without the linux- prefix).
 >> 

 > Do we need additional "patches" directory here ? Is this a convention
 > we need to follow for adding patches ?

This is for the generic (E.G. not specific to the Linux package)
BR2_GLOBAL_PATCH_DIR option. With this, it will look in
$BR2_GLOBAL_PATCH_DIR/linux for linux patches, and yes - Our convention
is to use board/<vendor>/<board>/patches for the toplevel BR2_GLOBAL_PATCH_DIR.

-- 
Bye, Peter Korsgaard
