From: Christian Stewart <christian@paral.in>
Date: Wed, 04 Nov 2015 21:21:41 +0000
Subject: [Buildroot] [PATCHv6] package/golang: new package
In-Reply-To: <20151104183119.107ccc45@free-electrons.com>
References: <1438277053-10053-1-git-send-email-yann.morin.1998@free.fr>
 <20151021230701.4701e646@free-electrons.com>
 <CA+h8R2p5xgF7rJJW5z0AzB7b359F=S9yWrXpiTmCVK-D0Sk8pw@mail.gmail.com>
 <CA+h8R2rbM2BTMLLuczMk741Otm3EBySYPEZi8QbPZrGzf=41zQ@mail.gmail.com>
 <CA+h8R2r33RBdHNCq6dyZFE5FE_FQ2yJFjWqBGt8+wgOPCbeO+w@mail.gmail.com>
 <20151104172118.GB4072@free.fr> <20151104183119.107ccc45@free-electrons.com>
Message-ID: <CA+h8R2pTn48GzacG14mBVWJcReFCdGH5jRTRp1wwoxSuZF98PQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

Would you like to address these or should I? If I add the command with env
variables variable as well as the docs, should I respin it or should I send
it to you? What's the best way to do this?

Correct. Also, I think I raised a few comments (about gofmt, about the
> situations where go in the target is useful). Those comments were
> answered, but it would be nicer if the answers were turned into actual
> comments into the code, or in the Config.in help text.
>

Thanks!
Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151104/bef5c71b/attachment.html>
