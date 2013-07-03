From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 03 Jul 2013 23:02:31 +0200
Subject: [Buildroot] [PATCH 09/23] gcc: common definitions
In-Reply-To: <1372620553-11416-10-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Jun 2013 21:28:59 +0200")
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1372620553-11416-10-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87r4ffpdaw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/gcc/Config.in.host | 128 ++++++++++++++++++++++++++++++++++++
 Thomas>  package/gcc/gcc.mk         | 159 +++++++++++++++++++++++++++++++++++++++++++++
 Thomas>  2 files changed, 287 insertions(+)
 Thomas>  create mode 100644 package/gcc/Config.in.host
 Thomas>  create mode 100644 package/gcc/gcc.mk

 Thomas> +++ b/package/gcc/gcc.mk
 Thomas> @@ -0,0 +1,159 @@
 Thomas> +
 Thomas> +# Common variables for the gcc-initial, gcc-intermediate and gcc-final
 Thomas> +# packages.
 Thomas> +

I've changed this to a more "standard" file header and committed,
thanks.

-- 
Bye, Peter Korsgaard
