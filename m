From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Nov 2016 22:43:26 +0100
Subject: [Buildroot] [PATCH] package/tvheadend: bump version to
 v4.1-2345 and fix version reporting
In-Reply-To: <B12CF9A8-74C8-438D-8DB3-9AB9E45F91FD@gmail.com>
References: <20161128103231.21626-1-damjan.marion@gmail.com>
 <20161128220315.1924903c@free-electrons.com>
 <8D43E2E0-8E99-4D96-8323-E1F360077FD4@gmail.com>
 <20161128221339.564e219f@free-electrons.com>
 <B12CF9A8-74C8-438D-8DB3-9AB9E45F91FD@gmail.com>
Message-ID: <20161128224326.4199d3f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Nov 2016 22:24:20 +0100, Damjan Marion wrote:

> > Because we're using a full hash in every other package fetched from Git
> > in Buildroot, and we like consistency :)  
> 
> Unfortunately that was only meaningful way (I?m aware of) to provide some
> human-readable version information out from their repo.

Well, the full hash is by far the most precise and exact information.
Anyone having the Git repository can do "git checkout <hash>" and get
straight to the exact same commit.

> I don't see how is this improvement compared to ?0.0.0~unknown?. I really doubt
> that it is worth time to submit that as a patch?.

Well, 0.0.0~unknown doesn't say anything about the version. The full
hash says it all.

> What about something like:
> 
> TVHEADEND_VERSION = 50a370707aedf5c127e92bb517c378aa8ac04657
> TVHEADEND_PRETTY_VERSION = v4.1-2345-g50a3707  

Which have to be maintained separately :/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
