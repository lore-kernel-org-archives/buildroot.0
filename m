From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Jan 2013 14:48:57 +0100
Subject: [Buildroot] [PATCH 2/2] package/tzdata: new package
In-Reply-To: <20130104134520.GA29894@mail.sceen.net>
References: <20130104134155.4ff8f301@skate>
 <1357304770-23310-1-git-send-email-rbraun@sceen.net>
 <20130104144119.5f8984f4@skate>
 <20130104134520.GA29894@mail.sceen.net>
Message-ID: <20130104144857.4f3fa7e4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Richard Braun,

On Fri, 4 Jan 2013 14:45:20 +0100, Richard Braun wrote:
> On Fri, Jan 04, 2013 at 02:41:19PM +0100, Thomas Petazzoni wrote:
> > I am wondering why we are generating the time zone data twice here with
> > the same argument? I know POSIX says that time zone data shouldn't take
> > leap seconds into account, so I understand the difference between
> > _output/posix and _output/right, but not between _output and
> > _output/posix.
> 
> The posix version is the default one.

Yes, but then why isn't _output/posix a symlink to _output/ ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
