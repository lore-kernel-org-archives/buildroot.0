From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 1 Apr 2016 17:08:02 +0200
Subject: [Buildroot] [PATCH v3 07/10] elf2flt: use new upstream site and
 add ARM patch
In-Reply-To: <1459450815-6494-8-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1459450815-6494-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1459450815-6494-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160401150801.GQ5944@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi THomas,
Thomas Petazzoni wrote,

> The uClinux developers now have a Github with elf2flt code, with an
> upstream that is again active. Let's switch to this upstream, to which
> Waldemar is contributing as well.
> 
> We also add an ARM patch from Waldemar that is needed to make ARM FLAT
> binaries work properly. Since this commit was on the previously used
> upstream, we add it together with the change of upstream location to
> keep the same functionality level.

Patch is applied upstream, please use latest git hash,
thx
 Waldemar
