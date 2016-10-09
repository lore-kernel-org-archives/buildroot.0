From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 9 Oct 2016 15:13:14 +0200
Subject: [Buildroot] [PATCH v2 1/3] gdb: get rid of host-texinfo
	dependency
In-Reply-To: <20161009150451.404e6641@free-electrons.com>
References: <1475953413-1950-1-git-send-email-patrickdepinguin@gmail.com>
 <20161009135552.5dd553fe@free-electrons.com>
 <20161009150451.404e6641@free-electrons.com>
Message-ID: <CAAXf6LXFxtsSONURriXdwWj2q03pK01yQ8_FrUfunTJuMOCsHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Oct 9, 2016 15:05, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
> On Sun, 9 Oct 2016 13:55:52 +0200, Thomas Petazzoni wrote:
>
> > All three patches applied to master. Thanks!
>
> And I reverted the texinfo patch and the binutils patch. The binutils
> patch badly breaks the build of the toolchain. See:
>
>
http://autobuild.buildroot.net/results/90d/90d0537bc12cbb2a7c6d344b3c6c9e1a5046d791/build-end.log
>
http://autobuild.buildroot.net/results/9a2/9a2b30bfd08c3a4af43f0523276eb5f799699aaa/build-end.log
>
http://autobuild.buildroot.net/results/d8a/d8a4afeeec8d6b070b17a067d0ded5aefe4e3f6a/build-end.log
>
> Please do a toolchain build before sending the next iterations of the
> patches. A basic ARM toolchain would not even build with your
> patches :-/

Will check, sorry...
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161009/bffc588e/attachment.html>
