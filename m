From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 14 Apr 2010 11:44:06 +0200
Subject: [Buildroot] [PATCH 23/41] autoconf: added AUTOHEADER variable
In-Reply-To: <l2u4d28d4b51004140137l4f0c31cft5fd36f8f17cc93a4@mail.gmail.com>
	(Lionel Landwerlin's message of "Wed, 14 Apr 2010 10:37:27 +0200")
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
	<1271199974-30434-24-git-send-email-llandwerlin@gmail.com>
	<87zl16fnv5.fsf@macbook.be.48ers.dk>
	<l2u4d28d4b51004140137l4f0c31cft5fd36f8f17cc93a4@mail.gmail.com>
Message-ID: <87ochmfjx5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lionel" == Lionel Landwerlin <llandwerlin@gmail.com> writes:

Hi,

 >> ?llandwerlin> ?AUTOCONF:=$(HOST_DIR)/usr/bin/autoconf
 >> ?llandwerlin> +AUTOHEADER:=$(HOST_DIR)/usr/bin/autoheader
 >> 
 >> Why? What uses it?

 Lionel> autoreconf uses it, otherwise it will use the system's one.

Ok, thanks - That might be useful info for the commit message.

-- 
Bye, Peter Korsgaard
