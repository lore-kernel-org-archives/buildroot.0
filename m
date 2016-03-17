From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Mar 2016 09:20:14 +0100
Subject: [Buildroot] [PATCH 2/4] libcap: add patch to fix build issue
 with old kernel headers
In-Reply-To: <87pouu6o1o.fsf@dell.be.48ers.dk>
References: <1458159611-5613-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458159611-5613-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <8737rq83wg.fsf@dell.be.48ers.dk>
 <20160316233420.2b5f2d47@free-electrons.com>
 <87pouu6o1o.fsf@dell.be.48ers.dk>
Message-ID: <20160317092014.20ca2072@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Mar 2016 23:44:19 +0100, Peter Korsgaard wrote:

>  > My commit log is talking about XATTR_SECURITY_PREFIX, not
>  > XATTR_CAPS_SUFFIX.
> 
> Well, you wrote ".. but using XATTR_SECURITY_PREFIX and
> XATTR_CAPS_SUFFIX which were defined in the kernel-only part of
> <linux/xattr.h>"

Gaah, bad commit log :-/ Sorry about that.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
