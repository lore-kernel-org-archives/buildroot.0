From: cem akpolat <akpolatcem@gmail.com>
Date: Mon, 26 May 2014 14:04:33 +0200
Subject: [Buildroot] ssh connection: connection refused?
In-Reply-To: <20140526135131.740b337d@free-electrons.com>
References: <CAMm5Yqorxn=XyRZNGPpAx8xKtJDhtuAdhvuJLwR71ixzw0QUDQ@mail.gmail.com>
 <20140526135131.740b337d@free-electrons.com>
Message-ID: <CAMm5Yqqa4ajmfiRzgivA2pcnVaLhbaR=ni5fC_-N6YiH5Pbsww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

I am using both, dropbear and openssh. If using together leads to the
conflict, I should disable one of them. By the way, I can boot first time
the file system, I can login via ssh, but the second time I cannot and
receive "connection refused". I have right now two init scripts under
init.d. One for dropbear S50dropbear and the other for probably openssh
S50sshd.

Thanks,
Cem

Cem Akpolat


On Mon, May 26, 2014 at 1:51 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear cem akpolat,
>
> On Mon, 26 May 2014 13:34:02 +0200, cem akpolat wrote:
>
> > I set the root passwod of the file system in the menuconfig and
> > establish a ssh connection to my file system. Some ssh keys are
> > generated as below, but then I couldn't connect second time to the
> > file system. it results in "connection refused". What could be the
> > principal reason underlying this issue?
>
> The SSH server is not running.
>
> Which SSH server are you using? Buildroot has support for Dropbear and
> OpenSSH, and both packages have init scripts to start the server at
> boot time.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140526/44954684/attachment.html>
