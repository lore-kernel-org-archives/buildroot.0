From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 08 Feb 2013 22:31:11 +0100
Subject: [Buildroot] [PATCH] libffi: add patch to fix library
	installation location
In-Reply-To: <1360274349-14855-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 7 Feb 2013 22:59:09 +0100")
References: <1360274349-14855-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87mwvefq74.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The libffi library was installed in a wrong directory when using the
 Thomas> non-default variant of a multilib toolchain. We fix this by patching
 Thomas> the libffi Makefile.am to install its library in a normal
 Thomas> location. The patch has been submitted upstream.

Committed, thanks.

-- 
Bye, Peter Korsgaard
