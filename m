From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Jul 2014 21:51:11 +0200
Subject: [Buildroot] Binutils version used on MIPS
In-Reply-To: <20140702174647.4021cc92@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 2 Jul 2014 17:46:47 +0200")
References: <20140701201445.3caa5150@free-electrons.com>
 <53B3B9F4.9010800@imgtec.com> <87simjbx8x.fsf@dell.be.48ers.dk>
 <20140702174647.4021cc92@free-electrons.com>
Message-ID: <87bnt7bkuo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Time has perhaps come to move to 2.23 or 2.24, I don't really know.

 > Right, but Vicente patch simply removes the usage of a special version
 > for MIPS, so MIPS now just uses whatever is the default version used
 > for all architectures in Buildroot. Which I think is the right thing to
 > do, unless there are special reasons to use a different version than
 > the default one (such as AVR32 need of an old version, or
 > Microblaze/PowerPC64LE need of a new version).

Yes, I completely agree, my comment was in regard to the references to
2.23 / 2.24.

-- 
Bye, Peter Korsgaard
