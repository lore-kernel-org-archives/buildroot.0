From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 May 2018 14:41:28 +0200
Subject: [Buildroot] [PATCH 1/1] snort: fix build on sparc v8
In-Reply-To: <CANu7NGtFKmJdQoT_-ecuUyG3Apctxm-6u7kjiYPeHOqkbk-L2w@mail.gmail.com>
References: <20180510111748.26293-1-fontaine.fabrice@gmail.com>
 <20180513214550.529cba8c@windsurf.home>
 <CANu7NGtFKmJdQoT_-ecuUyG3Apctxm-6u7kjiYPeHOqkbk-L2w@mail.gmail.com>
Message-ID: <20180515144128.602fea19@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 May 2018 13:56:29 -0300, Sergio Prado wrote:

> > However, I haven't been able to find an upstream Git repository for
> > Snort, so I'm wondering how the existing Git-formatted patches have
> > been generated. Perhaps from a repository created locally using git
> > init+git add ?
> >
> > Sergio, since you added the snort package, how did you generate the
> > patches ?  
> 
> Yes, I manually created the git repository to generate the patches.

OK, that explains the Git-formatted patches, without any obvious
upstream Git repository available online.

> I have also sent the patches upstream and ping one time after a
> month, but got no responses so far.

OK, too bad. Is snort unmaintained ? Is upstream focused on this snort3
project ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
