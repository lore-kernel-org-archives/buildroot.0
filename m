From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 20 Oct 2015 22:40:35 +1300
Subject: [Buildroot] [PATCH] syslog-ng: Specify location of libesmtp
In-Reply-To: <87fv15286n.fsf@dell.be.48ers.dk>
References: <1445328991-29416-1-git-send-email-judge.packham@gmail.com>
 <87fv15286n.fsf@dell.be.48ers.dk>
Message-ID: <CAFOYHZA0PXC4t6opOkztezy1hdU5Zhcoom34oM6+5JT2Fsb8MQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, Oct 20, 2015 at 10:36 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Chris" == Chris Packham <judge.packham@gmail.com> writes:
>
>  > If --with-libesmtp is omitted a host tool is invoked to detect the
>  > location of the library and headers, which is obviously the wrong thing
>  > for a cross-compile environment. Explicitly add --with-libesmtp to
>  > resolve this.
>
>  > Fixes:
>  > http://git.buildroot.net/buildroot/commit/?id=539acb7500588d0a277357cf831c9f25f770578d
>  > http://git.buildroot.net/buildroot/commit/?id=01f41585a78406f6e830d5eaf4413a983812a299

Oops this is the url of the HEAD commit not the url of the build
result. This should have been

  http://autobuild.buildroot.net/results/b82/b8224ea52d962c62ead367343d68bf98a4b9e883/
  http://autobuild.buildroot.net/results/445/445270aed4c79cde75d54d49d13ffad9d684c61b/

Probably doesn't matter but If you want you could revert and fix up
the commit message to correct the URL.
