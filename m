From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 19:15:14 +0100
Subject: [Buildroot] Problem when $(PKG)_SOURCE does not contain
 $(PKG)_VERSION
In-Reply-To: <20170325153443.GA7050@itchy>
References: <20170325143456.GA2470@itchy>
 <20170325154712.793f92be@free-electrons.com>
 <20170325153443.GA7050@itchy>
Message-ID: <20170325191514.7f6a47e1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Mar 2017 16:34:43 +0100, Eric Le Bihan wrote:
> On 17-03-25 15:47:12, Thomas Petazzoni wrote:

> > Simply add a hash file, Buildroot will realize the hash is different
> > and re-download the tarball.  
> 
> What puzzles me was that I already had set a hash file. I'll do more
> tests.
> 
> Thanks for the hint.

Well, of course, there might be a bug. Don't hesitate to provide more
details, such as a way to reproduce, if you still see the issue.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
