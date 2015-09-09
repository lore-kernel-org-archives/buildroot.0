From: Brendan Heading <brendanheading@gmail.com>
Date: Wed, 9 Sep 2015 14:58:22 +0100
Subject: [Buildroot] [PATCHv3] gdb: prevent building the documentation
In-Reply-To: <20150909154913.72954fbc@free-electrons.com>
References: <1441800739-14854-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150909154913.72954fbc@free-electrons.com>
Message-ID: <CA+BsyQ4j5udg-jsL-A7Spm6jiDtxfaN4sTF1_MYdbFD7XB8rYQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Maybe we could do a similar thing for the binutils package (which is
> the only other user of the host-texinfo package), and then remove the
> host-texinfo package altogether. That's obviously a completely separate
> set of changes.

Why not keep host-texinfo around, even if it is not used by any
package which is included with buildroot ?

It would be useful to people maintaining their own packages within
buildroot, now or in the future, where it's easier for them to add the
dependency rather than figure out how/where to patch the package to
prevent it from building documentation.

Brendan
