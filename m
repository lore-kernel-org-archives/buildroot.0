From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 12 Feb 2014 09:43:59 +0100
Subject: [Buildroot] Supporting multiple versions of toolchain
	components?
In-Reply-To: <20140212090324.4cb9fe84@skate> (Thomas Petazzoni's message of
 "Wed, 12 Feb 2014 09:03:24 +0100")
References: <1392054226-20285-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <52F936C7.4040300@mind.be> <20140210234117.352533a5@skate>
 <52F9D9D0.8090409@mind.be> <20140211093221.28248844@skate>
 <52FA5AD8.4040506@mind.be> <20140212090324.4cb9fe84@skate>
Message-ID: <87mwhwu3e8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> Note that I'm not immediately advocating for removing the multiple
 >> version support where we have it already. Rather, I propose to not add
 >> more multiversion packages.

 > I certainly agree with you on this. I would propose to:

 >  1/ Remove the multiversion selection on Busybox, because I don't
 >     really see why we have this specifically for Busybox.

 >  2/ Keep a maximum number of three gcc, binutils, gdb and C library
 >     versions. Like: the latest one, the N-1 (default), and the N-2.

Sounds good to me. Let's also do the same for kernel headers. We still
need to keep the arch specific versions though.

Will you send patches or should I do it myself?

-- 
Bye, Peter Korsgaard
