From: Nathan Lynch <ntl@pobox.com>
Date: Mon, 06 May 2013 18:21:12 -0500
Subject: [Buildroot] [PATCH v2] chrony: new package
In-Reply-To: <87wqrb4v61.fsf@dell.be.48ers.dk>
References: <1367866876-5339-1-git-send-email-ntl@pobox.com>
 <87wqrb4v61.fsf@dell.be.48ers.dk>
Message-ID: <1367882472.3081.4.camel@orca.stoopid.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2013-05-07 at 00:09 +0200, Peter Korsgaard wrote:
> 
> So apparently it isn't using autotools, but a handwritten
> configure. This could make it troublesome to use the autotools-package
> support (I haven't looked in detail to see if it's a problem though).
> 
> The 'Configuring for  Linux-x86_64' is a bit worrysome as I'm building
> for ARM.
> 
> The PKG_CONFIG_PATH warnings is an indication that you should depend on
> host-pkgconf. We also have a libnss package so you could add optional
> support for it.

Thanks, I'll look into resolving these issues.  FWIW, it does work
correctly on my MIPS target.
