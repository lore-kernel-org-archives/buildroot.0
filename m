From: Matthew Davison <matt.davison@lantronix.com>
Date: Wed, 20 Jan 2010 16:06:34 -0800
Subject: [Buildroot] glibc support
References: <8128F0FD6C26E14C8EB4BFDB92B8D6B2134AE1@2putt.int.lantronix.com>
	<2c9a759f1001200107g36629fdcicbaaa824fba9a6da@mail.gmail.com>
Message-ID: <8128F0FD6C26E14C8EB4BFDB92B8D6B2134AE5@2putt.int.lantronix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for your help. I followed your advice and successfully built a
toolchain with crosstool-NG, and configured it as my external toolchain
in buildroot. I spent a little time getting the buildroot's toolchain
configuration options to match those of my new toolchain, but this was
fairly simple, and mostly a process of trial and error. Once my
toolchain configuration options were correct, the resulting build was
successful.

Matt   

-----Original Message-----
From: Anders Darander [mailto:anders.darander at gmail.com] 
Sent: Wednesday, January 20, 2010 1:08 AM
To: Matthew Davison
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] glibc support

Hi Matt,

On Tue, Jan 19, 2010 at 23:29, Matthew Davison
<matt.davison@lantronix.com> wrote:
> Is building with glibc instead of uClibc currently supported in
buildroot?
> If so, what steps are required?

I've done this in a few projects. What I did (and I suppose everyone
else) is to build the cross-toolchain and glibc using crosstool-NG.
Then this toolchain can be used as an external toolchain in buildroot,
together with the glibc that you build. It is mostly pretty
straightforward.

Regards,
Anders
 
**********************************************************************
This e-mail is the property of Lantronix. It is intended only for the person or entity to which it is addressed and may contain information that is privileged, confidential, or otherwise protected from disclosure. Distribution or copying of this e-mail, or the information contained herein, to anyone other than the intended recipient is prohibited.
