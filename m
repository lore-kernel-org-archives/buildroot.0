From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Jun 2015 09:49:21 +0200
Subject: [Buildroot] [PATCH] heimdal: bump to version 1.6rc2
In-Reply-To: <87616a29na.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Fri, 26 Jun 2015 09:47:53 +0200")
References: <1435252182-26100-1-git-send-email-gustavo@zacarias.com.ar>
 <87616a29na.fsf@dell.be.48ers.dk>
Message-ID: <87y4j6zz7i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 >> -HEIMDAL_VERSION = 1.5.3
 >> +HEIMDAL_VERSION = 1.6rc2
 >> HEIMDAL_SITE = http://www.h5l.org/dist/src
 >> HEIMDAL_DEPENDENCIES = host-e2fsprogs host-pkgconf
 >> HEIMDAL_INSTALL_STAGING = YES
 >> # static because of -fPIC issues with e2fsprogs on x86_64 host
 >> -HOST_HEIMDAL_CONF_OPTS = --with-x=no --disable-shared --enable-static
 >> +HOST_HEIMDAL_CONF_OPTS = \
 >> +	--disable-shared \
 >> +	--enable-static \

 > Hmm, why are you hardcoding these? We already pass the correct
 > enable/disable lines in the autotools infrastructure.

Gaah, I need more coffee. For some reason I missed HOST_.

-- 
Bye, Peter Korsgaard
