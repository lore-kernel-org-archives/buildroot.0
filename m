From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Sep 2009 12:23:58 +0200
Subject: [Buildroot] [PATCH] Add i830 graphics driver to DirectFB
In-Reply-To: <1253754832.451.92.camel@station1.ormlab.com> (Ormund Williams's
	message of "Wed\, 23 Sep 2009 21\:13\:52 -0400")
References: <1253754832.451.92.camel@station1.ormlab.com>
Message-ID: <87vdj863pd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ormund" == Ormund Williams <ormundw@panix.com> writes:

Hi,

Thanks, committed with minor changes. There's a few things to keep in
mind for next time though:

1: You didn't have a signed-off-by: line - Please use git commit -s to
add it automatically when you commit.

2: You seem to be missing a -- seperator here, making the diffstat
output part of the commit message (which it shouldn't be). Did you send
the patch with git send-email?

 Ormund>  package/directfb/Config.in   |    6 ++++++
 Ormund>  package/directfb/directfb.mk |    3 +++
 Ormund>  2 files changed, 9 insertions(+), 0 deletions(-)

 Ormund> +config BR2_PACKAGE_DIRECTFB_I830
 Ormund> +	bool "compile i830 graphics driver"
 Ormund> +	default n
 
'n' is the default anyway, so there's no need to add it explicitly.

-- 
Bye, Peter Korsgaard
