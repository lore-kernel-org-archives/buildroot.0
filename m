From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 18:31:19 +0100
Subject: [Buildroot] [PATCHv6] package/golang: new package
In-Reply-To: <20151104172118.GB4072@free.fr>
References: <1438277053-10053-1-git-send-email-yann.morin.1998@free.fr>
 <20151021230701.4701e646@free-electrons.com>
 <CA+h8R2p5xgF7rJJW5z0AzB7b359F=S9yWrXpiTmCVK-D0Sk8pw@mail.gmail.com>
 <CA+h8R2rbM2BTMLLuczMk741Otm3EBySYPEZi8QbPZrGzf=41zQ@mail.gmail.com>
 <CA+h8R2r33RBdHNCq6dyZFE5FE_FQ2yJFjWqBGt8+wgOPCbeO+w@mail.gmail.com>
 <20151104172118.GB4072@free.fr>
Message-ID: <20151104183119.107ccc45@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 4 Nov 2015 18:21:18 +0100, Yann E. MORIN wrote:

> On 2015-11-04 15:39 +0000, Christian Stewart spake thusly:
> > Is there anything that needs to be done regarding golang for it to be
> > merged? After golang we can push towards docker support.
> 
> IIRC, we need to provide an $(TUPLE)-go to act as a cross-compiler. That
> would be a shell script that exports the appropriate environement
> variables (you provided the list) and then calls the real go executable.
> 
> Otherwise, just calling the go program, even when set up as a
> cross-compiler, does not produce target binaries as we've observed.

Correct. Also, I think I raised a few comments (about gofmt, about the
situations where go in the target is useful). Those comments were
answered, but it would be nicer if the answers were turned into actual
comments into the code, or in the Config.in help text.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
