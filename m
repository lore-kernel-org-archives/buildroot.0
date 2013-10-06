From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Oct 2013 23:26:08 +0200
Subject: [Buildroot] [PATCHv2 04/21] toolchain: move helpers.mk into
 toolchain-external/
In-Reply-To: <87a9imdwm5.fsf@dell.be.48ers.dk>
References: <1381069171-29748-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381069171-29748-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <87a9imdwm5.fsf@dell.be.48ers.dk>
Message-ID: <20131006232608.432630fe@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sun, 06 Oct 2013 21:31:46 +0200, Peter Korsgaard wrote:

>  Thomas> -include toolchain/helpers.mk
>  Thomas> -
> 
> That doesn't seem right as we have:
> 
> git grep copy_toolchain package/
> package/glibc/glibc.mk:         $(call copy_toolchain_lib_root,$(STAGING_DIR)/,,

Oh, I'm impressed how well you know the code, even code that I have
written. We really need some kind of "test suite" to check patches or
something like that: a patch set such as this toolchain-related patch
set is really a pain to test in all the various possible conditions. I
did test the internal backend, but only with uClibc toolchain.

I'll rework my patch series.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
