From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 09 Sep 2010 10:32:32 +0200
Subject: [Buildroot] [PATCH] QT: Bump to 4.6.3
In-Reply-To: <1282133494-13795-1-git-send-email-paul@pauljones.id.au> (Paul
	Jones's message of "Wed, 18 Aug 2010 22:11:34 +1000")
References: <1282133494-13795-1-git-send-email-paul@pauljones.id.au>
Message-ID: <8739tjco67.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paul" == Paul Jones <paul@pauljones.id.au> writes:

 Paul> Also add option to build example and demo code
 Paul> Signed-off-by: Paul Jones <paul@pauljones.id.au>

Thanks, committed except for the patch change which was broken (you have
to escape the wildcards).

 Paul>  	toolchain/patch-kernel.sh $(QT_TARGET_DIR) package/qt/ \
 Paul> -		qt-$(QT_VERSION)-\*.patch \
 Paul> -		qt-$(QT_VERSION)-\*.patch.$(ARCH)
 Paul> +		*.patch \
 Paul> +		*.patch.$(ARCH)
 Paul>  	touch $@

-- 
Bye, Peter Korsgaard
