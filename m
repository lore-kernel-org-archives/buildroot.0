From: Daniel Mack <daniel@caiaq.de>
Date: Tue, 5 May 2009 09:46:09 +0200
Subject: [Buildroot] Create user git repository at uclibc.org
In-Reply-To: <d6cda7730905041746p7a9e8eaeg4ab32b4016ba73e6@mail.gmail.com>
References: <d6cda7730905041746p7a9e8eaeg4ab32b4016ba73e6@mail.gmail.com>
Message-ID: <20090505074609.GA22117@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 04, 2009 at 09:46:30PM -0300, Thiago A. Corr?a wrote:
>    Peter, I'm still lost here :(
>    I've created a git folder at my home then did a git clone from
> buildroot, but that didn't expose a private branch. Then I thought I
> needed to do a git init, but then again, all I got was a .git folder.
>    As I said, your message [1] still isn't clear to those of us who
> don't know this beast.

There is no 'private branch' in the upstream git. You need to create one
for your purpose after cloning with 'git checkout -b myprivatebranch'.

See http://www.kernel.org/pub/software/scm/git/docs/gittutorial.html and
all the other docs on this site. A post that I found quite comprehensive
is http://tomayko.com/writings/the-thing-about-git.

Daniel
