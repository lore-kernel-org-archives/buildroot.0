From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Jan 2011 21:12:36 +0100
Subject: [Buildroot] [git commit master 1/1] sshfs: select openssh
	instead of depending
In-Reply-To: <20110124172820.13b2e781@surf> (Thomas Petazzoni's message of
	"Mon, 24 Jan 2011 17:28:20 +0100")
References: <20110117202412.A4D0289008@busybox.osuosl.org>
	<20110124172820.13b2e781@surf>
Message-ID: <87pqrmrrgr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Then presumably we should:

 >> SSHFS_DEPENDENCIES = libglib2 libfuse $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)

 Thomas> SSHFS_DEPENDENCIES = \
 Thomas> 	libglib2 libfuse openssh \
 Thomas> 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
 Thomas> 	$(if $(BR2_ENABLE_LOCALE),,libiconv)

 Thomas> (i.e add openssh and libiconv in the dependencies)

Ahh yes, will fix - Thanks.

-- 
Bye, Peter Korsgaard
