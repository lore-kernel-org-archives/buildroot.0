From: Richard Braun <rbraun@sceen.net>
Date: Fri, 28 Sep 2012 14:17:58 +0200
Subject: [Buildroot] [PATCH] intel-microcode: new package
In-Reply-To: <20120922094203.GA11192@mail.sceen.net>
References: <1348153949-30525-1-git-send-email-rbraun@sceen.net>
 <20120920223646.65a34101@skate>
 <20120920211255.GA32421@mail.sceen.net>
 <20120921103513.01871dd2@skate>
 <20120922094203.GA11192@mail.sceen.net>
Message-ID: <20120928121758.GA2362@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 22, 2012 at 11:42:03AM +0200, Richard Braun wrote:
> Unfortunately no, the microcode file is the only one.

While it's the only file, the license is actually embedded inside, in
plain text. I've modified the package to extract the license as a
separate file in the build directory. The package infrastructure also
had to be slightly change to save legal info for proprietary packages.
Patches will follow.

-- 
Richard Braun
