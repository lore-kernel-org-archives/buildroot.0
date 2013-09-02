From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Sep 2013 22:51:19 +0200
Subject: [Buildroot] [PATCHv2 2/4] kmod: allow to build a host variant
In-Reply-To: <1377624514-10510-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 27 Aug 2013 19:28:32 +0200")
References: <1377624514-10510-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1377624514-10510-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87sixn7xrs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Since module-init-tools is deprecated, we now want to use kmod instead
 Thomas> for the installation of modules during the kernel build process. In
 Thomas> order to do this, we need to be able to build a host variant of kmod,
 Thomas> which is want this patch allows to do.

 Thomas> Note that only the depmod tool is installed on the host, since that's
 Thomas> the only one likely to be used on the host in a cross-compilation
 Thomas> context.

Committed, thanks.

-- 
Bye, Peter Korsgaard
