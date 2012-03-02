From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 02 Mar 2012 07:24:08 +0100
Subject: [Buildroot] [Uclibc-admins] [support.osuosl.org #18542] DNS for
	busybox and uclibc
In-Reply-To: <rt-3.6.3-18415-1330645594-1915.18542-6-0@osuosl.org> (Jordan
 Evans via's message of "Thu, 01 Mar 2012 23:46:35 +0000")
References: <RT-Ticket-18542@osuosl.org>
 <20110223180353.GA12909@mail.codepoet.org>
 <87k4gqy3l7.fsf@macbook.be.48ers.dk> <1298513604.9591.4.camel@here>
 <rt-3.6.3-28144-1330131070-1967.18542-6-0@osuosl.org>
 <rt-3.6.3-4281-1330376278-43.18542-6-0@osuosl.org>
 <20120228002705.GA4145@mail.codepoet.org>
 <rt-3.6.3-29186-1330388828-305.18542-6-0@osuosl.org>
 <20120301152859.GA25060@mail.codepoet.org>
 <rt-3.6.3-25326-1330615757-951.18542-6-0@osuosl.org>
 <rt-3.6.3-18415-1330645594-1915.18542-6-0@osuosl.org>
Message-ID: <87y5rj5xmf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jordan" == Jordan Evans via RT <support@osuosl.org> writes:

FYI,

The DNS issues should now be resolved.

 Jordan> Looks like buildroot.uclibc.org had two entries, one a pointer
 Jordan> and one a cname. I went ahead and removed the cname to match
 Jordan> the original entries you had before. Sorry about that.

 Jordan> That was caused by the fact that we actually already had most of your 
 Jordan> dns entries in our system, I only had to add a few by hand the other 
 Jordan> day.

 Jordan> --Jordan Evans

-- 
Bye, Peter Korsgaard
