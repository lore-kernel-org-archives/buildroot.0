From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 22 Dec 2011 12:19:40 +0100
Subject: [Buildroot] Buildroot & GIT branch
In-Reply-To: <DUB105-W30E0FD52CE9490FC698A25CDAA0@phx.gbl>
References: <DUB105-W30E0FD52CE9490FC698A25CDAA0@phx.gbl>
Message-ID: <CAAXf6LVb=h2rObnfJ8RBncyrwo5cONuvDi5c83PaDCbKTxKBWw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Janne,

On Thu, Dec 22, 2011 at 12:06 PM, Janne H?meenaho
<jannehameenaho@hotmail.com> wrote:
> Hi,
>
> Thanks for a great SW! Buildroot is an achievement.
>
> I'm a new users and I've got a problem:
>
> I need to use my own branch of Linux kernel GIT repository which is on my
> server. Let's call it my_branch. How do I config Buildroot to pull that
> branch?
>
> Buildroot successfully uses master branch.

I think you should put the branch name as Linux kernel version in the
configuration.

Best regards,
Thomas
