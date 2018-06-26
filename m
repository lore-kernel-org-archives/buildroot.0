From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Jun 2018 10:24:18 +0200
Subject: [Buildroot] [arc-buildroot] Re: [PATCH] toolchain: Bump ARC
 tools to arc-2018.03 release
In-Reply-To: <20180626090623.1d84aa7f@windsurf.home> (Thomas Petazzoni's
 message of "Tue, 26 Jun 2018 09:06:23 +0200")
References: <20180625154535.21098-1-didin@synopsys.com>
 <20180625215719.4a04bde3@windsurf.home>
 <2dbb659af2557f7e70e267b84b7a0360de2b5201.camel@synopsys.com>
 <20180626090623.1d84aa7f@windsurf.home>
Message-ID: <87bmbydkgd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Mon, 25 Jun 2018 23:30:47 +0000, Alexey Brodkin wrote:

 >> > This patch did not apply to master as-is, due to the changes on gdb
 >> > that Peter merged yesterday. I fixed up the conflict and applied to
 >> > master.
 >> > 
 >> > I also did a follow-up commit, to make sure BR2_PACKAGE_GDB_NEEDS_CXX11
 >> > is enabled when the ARC version of gdb is used: it's based on GDB 8.0,
 >> > so it needs C++11 support.  
 >> 
 >> Any chance for this one to be applied to 2018.05.x branch as this is just
 RC2-> Release bump?

 > I saw this note in the patch. It's up to Peter to decide what to do
 > about this, but considering it only touches ARC toolchain components, I
 > don't see why we couldn't backport this to 2018.05.

Yes, I'll get around to it this week.

-- 
Bye, Peter Korsgaard
