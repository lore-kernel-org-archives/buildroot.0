From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 03 Oct 2009 09:24:51 +0200
Subject: [Buildroot] [PATCH] directfb: add host-directfb target for
	directfb-csource
In-Reply-To: <1254486004-21899-1-git-send-email-s.neumann@raumfeld.com> (Sven
	Neumann's message of "Fri\, 2 Oct 2009 14\:20\:04 +0200")
References: <8763ay6n3j.fsf@macbook.be.48ers.dk>
	<1254486004-21899-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87pr95548s.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

Hi,

 Sven> directfb-csource is a code generation tool that may be needed to build
 Sven> other packages. Add host-directfb target that installs directfb-csource
 Sven> in the host_dir.

 Sven> +DIRECTFB_HOST_DIR:=$(BUILD_DIR)/directfb-$(DIRECTFB_VERSION)-host
 Sven> +DIRECTFB_HOST_BINARY:=$(HOST_DIR)/usr/bin/directfb-csource
 Sven> +
 Sven> +$(DL_DIR)/$(DIRECTFB_SOURCE):
 Sven> +        $(call DOWNLOAD,$(DIRECTFB_SITE),$(DIRECTFB_SOURCE))

Hmm, this somehow had tabs replaced by spaces - How did that happen? git
send-email normally doesn't do stuff like that.

Anyway, fixed now.

-- 
Bye, Peter Korsgaard
