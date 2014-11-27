From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Nov 2014 00:57:55 +0100
Subject: [Buildroot] Split supported architectures for Qt Script and Qt
	Webkit
In-Reply-To: <546DD5C9.8090600@imgtec.com> (Vicente Olivert Riera's message of
 "Thu, 20 Nov 2014 11:51:37 +0000")
References: <546DD5C9.8090600@imgtec.com>
Message-ID: <87tx1kmc1o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Dear all,
 > please I would like you read this email and provide some feedback before
 > I start writing a patch.

Thanks for investigating!

 > I have assigned a code to each kind of problem I have found, and the
 > meaning of those codes are just below the table.

 > +------------------+-----------+-----------+----------+--------------+
 > | Architecture     | Qt Script | Qt Webkit | Grantlee | Problem Code |
 > +------------------+-----------+-----------+----------+--------------+
 > | BR2_aarch64      | YES       | NO        | YES      | 2            |
 > | BR2_nios2        | YES       | NO        | NO       | 4            |

So the only ones not covered today are these two, right? What about the
mips variant you mentioned above?

The BR2_aarch64 issue will presumably be solved in future qtwebkit
releases once the arch gets a bit more used. The nios issue is an
internal compiler error, that is less likely to get fixed (until a new
compiler is released atleast).

-- 
Bye, Peter Korsgaard
