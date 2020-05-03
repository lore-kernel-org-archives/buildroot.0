From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 3 May 2020 15:55:33 +0200
Subject: [Buildroot] Issue compiling on Ubuntu under WSL
In-Reply-To: <CA+1XQn=Np1jRm6A+drXhFaWrzUHR2yfHcXTvNFL6HHhJUTy5JQ@mail.gmail.com>
References: <CA+1XQnkaNvzxb2gyse=UOR1AvE=uxCks7KuLmPmbmdgusDd+GQ@mail.gmail.com>
 <CA+1XQn=Np1jRm6A+drXhFaWrzUHR2yfHcXTvNFL6HHhJUTy5JQ@mail.gmail.com>
Message-ID: <20200503155533.6a361693@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Renato,

On Sun, 3 May 2020 08:28:07 -0300
Renato Moutinho <renato.moutinho@gmail.com> wrote:

>     I've been trying to compile buildroot on Unbuntu running under WSL. I
> assume this isn't a supported configuration but my intention is to provide
> additional information for an issue opened on WSL's github.
> 
> Ultimately, the build fails with the error reported below. What I wanted to
> do is prefix this last *mv *command with an *strace *so I can submit
> additional information to the WSL dev team but I'm unable to find the *Makefile
> *responsible for this command specifically. Can anyone help me with this?

This issue is also being discussed at
https://github.com/microsoft/WSL/issues/5108, i.e it has been reported
to WSL upstream.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
