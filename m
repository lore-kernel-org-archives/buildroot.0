From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Mar 2011 16:59:39 +0100
Subject: [Buildroot] Xtensa support
In-Reply-To: <4D81FB3E.7060307@carallon.com>
References: <1D6034426110564DA0DEA9EE9793B3835815AE17BF@NBE-MBX01.americas.swk.pri>
	<20110315180743.5e34890b@surf>
	<1D6034426110564DA0DEA9EE9793B3835815AE19D2@NBE-MBX01.americas.swk.pri>
	<20110315192211.3c59f861@surf>
	<1D6034426110564DA0DEA9EE9793B3835815AE1A1F@NBE-MBX01.americas.swk.pri>
	<20110315210538.1973f87f@surf>
	<779935.72384.qm@web161802.mail.bf1.yahoo.com>
	<4D81FB3E.7060307@carallon.com>
Message-ID: <20110318165939.651bf88b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Mar 2011 12:14:54 +0000
William Wagner <will_wagner@carallon.com> wrote:

> Would be great to have an example of recommended practice checked in
> for people to see/copy.

Yeah, I could document how I build the latest system I've done.

> Also would be great to remove the xtensa bits as they are just
> confusing. Perhaps we should convert that over to the new scheme?

Well, the Xtensa bits are a bit complicated, because Xtensa supports
configurable CPU cores, so they have some strange Perl scripts that are
needed when building the toolchain. But this Xtensa support has never
been updated since it has been merged quite some time ago, and no
active contributor has any Xtensa hardware platform to test the changes
on, so maybe we could drop the support for Xtensa altogether.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
