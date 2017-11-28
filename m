From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 28 Nov 2017 08:25:21 -0600
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-11-27
In-Reply-To: <20171128070012.4EDDD20746@mail.free-electrons.com>
References: <20171128070012.4EDDD20746@mail.free-electrons.com>
Message-ID: <CANQCQpZZzurPy3cJCYpg5z67+hogAnN=syKtGui4fEr4B6GyFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Nov 28, 2017 at 1:00 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
[snip]
>  powerpc64le | make[1]: *** [qfsfileengine... | TIM | http://autobuild.buildroot.net/results/fde2ab8aeb2f5f3b91d80c47d7177adfb778f883 |

I've noticed the size of the builds are getting much larger as the
number of failures is going down.  Has there been any previous
discussion about having the timeout conditional on if the build is
still progressing vs just a blink duration?  I was thinking we could
do a check for file modifications or something periodically vs a hard
timeout.

Matt
