From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 06 Dec 2012 09:30:17 -0800
Subject: [Buildroot] [PATCH v5] neard: new package
In-Reply-To: <877gow9uqw.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Wed, 05 Dec 2012 11:14:31 -0800")
References: <1354732747-5843-1-git-send-email-spdawson@gmail.com>
 <877gow9uqw.fsf@dell.be.48ers.dk>
Message-ID: <87d2yn142e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:
 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>
 spdawson> ---
 spdawson> v5: Resend
 spdawson> v4: No changes; patch series version bumped
 spdawson> v3: Incorporated improvements suggested by Baruch Siach,
 spdawson> add Arnout Vandecappelle's acks
 spdawson> v2: Incorporated improvements suggested by Thomas Petazzoni

 spdawson> +config BR2_PACKAGE_NEARD
 spdawson> +	bool "neard"
 spdawson> +	select BR2_PACKAGE_DBUS
 spdawson> +	select BR2_PACKAGE_LIBGLIB2
 spdawson> +	select BR2_PACKAGE_LIBNL

 Peter> You forgot to add the dependencies for the toolchain options needed by
 Peter> dbus/libglib2/libnl.

 Peter> Committed with that fixed, thanks.

It seems to cause build failures though - Care to look at it?

http://autobuild.buildroot.net/results/eb2e3e8c604e26738f73b55e788b969d4a3dee23/build-end.log

-- 
Bye, Peter Korsgaard
