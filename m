From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 17 Feb 2019 23:34:46 -0300
Subject: [Buildroot] Runtime test issues
References: <20190213222533.35cac79e@windsurf>
Message-ID: <5c6a19c6542c1_778d3fe40013f97499884@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, Feb 13, 2019 at 07:25 PM, Thomas Petazzoni wrote:

[snip]
>  - tests.download.test_git.TestGitRefs
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/158295269

When using recent versions of git the download of the sha1 of a special ref
works because of this line in support/download/git:
  _git fetch origin "'${cset}:${cset}'"
I tested using:
git version 2.17.1

The git version installed in our docker image does not support it.

I will reply to another email thread about this.

Regards,
Ricardo
