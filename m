From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 03 Jul 2013 23:38:58 +0200
Subject: [Buildroot] [PATCH 12/23] gcc-final: new package
In-Reply-To: <1372620553-11416-13-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Jun 2013 21:29:02 +0200")
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1372620553-11416-13-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87sizvnx1p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/gcc/gcc-final/gcc-final.mk | 136 +++++++++++++++++++++++++++++++++++++
 Thomas>  1 file changed, 136 insertions(+)
 Thomas>  create mode 100644 package/gcc/gcc-final/gcc-final.mk

 Thomas> +endif
 Thomas> +
 Thomas> +
 Thomas> +$(eval $(host-autotools-package))

Stripped the extra newline and committed, thanks.

-- 
Bye, Peter Korsgaard
