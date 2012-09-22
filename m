From: Richard Braun <rbraun@sceen.net>
Date: Sat, 22 Sep 2012 11:42:03 +0200
Subject: [Buildroot] [PATCH] intel-microcode: new package
In-Reply-To: <20120921103513.01871dd2@skate>
References: <1348153949-30525-1-git-send-email-rbraun@sceen.net>
 <20120920223646.65a34101@skate>
 <20120920211255.GA32421@mail.sceen.net>
 <20120921103513.01871dd2@skate>
Message-ID: <20120922094203.GA11192@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 21, 2012 at 10:35:13AM +0200, Thomas Petazzoni wrote:
> Ok. Thanks. And there is no zip file or tarball that contains both
> the license and the firmware? I'm simply worried about having just
> FOO_LICENSE = PROPRIETARY without a proper license file that indicates
> what license it is. Or maybe we need to put a special license file in
> package/intel-microcode/ and find a way to tell the license
> infrastructure that the license file is here rather than in the package
> itself?

Unfortunately no, the microcode file is the only one.

-- 
Richard Braun
