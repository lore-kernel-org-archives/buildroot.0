From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue, 15 May 2018 11:28:08 -0300
Subject: [Buildroot] [PATCH 1/1] snort: fix build on sparc v8
In-Reply-To: <20180515144128.602fea19@windsurf>
References: <20180510111748.26293-1-fontaine.fabrice@gmail.com>
 <20180513214550.529cba8c@windsurf.home>
 <CANu7NGtFKmJdQoT_-ecuUyG3Apctxm-6u7kjiYPeHOqkbk-L2w@mail.gmail.com>
 <20180515144128.602fea19@windsurf>
Message-ID: <CANu7NGvqbQtWRQwO6p0RCr528maWLaNTkrnbdHDkXfnLHv5HZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

> > I have also sent the patches upstream and ping one time after a
> > month, but got no responses so far.
>
> OK, too bad. Is snort unmaintained ? Is upstream focused on this snort3
> project ?

As far as I know, it is still maintained. The last release is
from 2017-12-06. But I think brand new features are being implemented in
3.X.

I could bump to 3.X, but since there are some compatibility issues between
2.X and 3.X, that would impact 2.X users. We could also have both versions
in Buildroot.

What do you think?

Best regards,

Sergio Prado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180515/3a2e86c3/attachment.html>
