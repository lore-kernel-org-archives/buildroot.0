From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 17 Mar 2016 20:39:22 +0100
Subject: [Buildroot] [PATCH 12/16] elf2flt: use new upstream site and
 add ARM patch
In-Reply-To: <1458164602-16983-13-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-13-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160317193922.GT21774@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> The uClinux developers now have a Github with elf2flt code, with an
> upstream that is again active. Let's switch to this upstream, to which
> Waldemar is contributing as well.
> 
> We also add an ARM patch from Waldemar, which was on his elf2flt
> repository and he submitted upstream.

It is not exactly the stuff I added to my repo, but it produces
working binaries ;)

Please use the updated patch from here:
http://mailman.uclinux.org/pipermail/uclinux-dev/2016-March/052707.html

This only left on build problem with -Werror.

Thanks 
 Waldemar
