From: Richard Braun <rbraun@sceen.net>
Date: Fri, 4 Jan 2013 14:57:34 +0100
Subject: [Buildroot] [PATCH 2/2] package/tzdata: new package
In-Reply-To: <20130104144857.4f3fa7e4@skate>
References: <20130104134155.4ff8f301@skate>
 <1357304770-23310-1-git-send-email-rbraun@sceen.net>
 <20130104144119.5f8984f4@skate>
 <20130104134520.GA29894@mail.sceen.net>
 <20130104144857.4f3fa7e4@skate>
Message-ID: <20130104135734.GA32503@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 04, 2013 at 02:48:57PM +0100, Thomas Petazzoni wrote:
> > The posix version is the default one.
> 
> Yes, but then why isn't _output/posix a symlink to _output/ ?

I expected this to be the real question :). A symlink allowing recursive
traversal seems like an easy way to get in trouble.

-- 
Richard Braun
