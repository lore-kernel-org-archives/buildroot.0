From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 12 Nov 2013 13:23:28 +0100
Subject: [Buildroot] [PATCH] audiofile: needs dynamic library
In-Reply-To: <52821764.5060109@zacarias.com.ar> (Gustavo Zacarias's message of
 "Tue, 12 Nov 2013 08:56:20 -0300")
References: <1384244924-31625-1-git-send-email-spdawson@gmail.com>
 <87ob5p4zix.fsf@dell.be.48ers.dk> <52821764.5060109@zacarias.com.ar>
Message-ID: <87k3gd4xmn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

> I think this is related to the nettle failure i've mentioned, after the
> gcc conversion host-gcc-final isn't installing libstdc++.a, and after an
> extra look it isn't even building it because of --disable-static in the
> default CONFIGURE_CMDS.
> So it'll never find a libstdc++.a for the internal toolchain in staging.
> Regards.

Yes, but I've just tested with an external toolchain where libstdc++.a
IS copied to staging, and same problem.



-- 
Bye, Peter Korsgaard
