From: Richard Braun <rbraun@sceen.net>
Date: Fri, 4 Jan 2013 14:45:20 +0100
Subject: [Buildroot] [PATCH 2/2] package/tzdata: new package
In-Reply-To: <20130104144119.5f8984f4@skate>
References: <20130104134155.4ff8f301@skate>
 <1357304770-23310-1-git-send-email-rbraun@sceen.net>
 <20130104144119.5f8984f4@skate>
Message-ID: <20130104134520.GA29894@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 04, 2013 at 02:41:19PM +0100, Thomas Petazzoni wrote:
> I am wondering why we are generating the time zone data twice here with
> the same argument? I know POSIX says that time zone data shouldn't take
> leap seconds into account, so I understand the difference between
> _output/posix and _output/right, but not between _output and
> _output/posix.

The posix version is the default one.

-- 
Richard Braun
