From: Wetzel Andreas <Andreas.Wetzel@nanotronic.ch>
Date: Mon, 5 Oct 2015 08:18:47 +0000
Subject: [Buildroot] [PATCH 1/1] libwebsockets: add option to
 enable/disable ipv6 support
In-Reply-To: <87y4fj231g.fsf@dell.be.48ers.dk>
References: <1443014194-24211-1-git-send-email-andreas.wetzel@nanotronic.ch>,
 <87y4fj231g.fsf@dell.be.48ers.dk>
Message-ID: <8f91eae040594d31a57269d4212c8678@LysExc01.nanotronic.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>> "Andreas" == Andreas Wetzel <andreas.wetzel@nanotronic.ch> writes:

>> Added configuration option BR2_PACKAGE_LIBWEBSOCKETS_IPV6 that
>> adds -DLWS_IPV6=ON/OFF to LIBWEBSOCKETS_CONF_OPTS.

> So apparently this is a bug in libwebsockets? Have you brought up the
> issue with the libwebsockets developers?

I have not yet done that, but I'll for sure ask for comments in the libwebsockets list.

Regards,
Andi
