From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 May 2019 11:40:35 +0200
Subject: [Buildroot] [PATCH 3/3] package/strace: add patch for nds32
 support
In-Reply-To: <20190506093510.GA10187@app09>
References: <20190506090411.9453-1-nylon7@andestech.com>
 <20190506090411.9453-3-nylon7@andestech.com>
 <20190506111056.7d26c1e9@windsurf> <20190506093510.GA10187@app09>
Message-ID: <20190506114035.00590343@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 6 May 2019 17:35:10 +0800
Nylon Chen <nylon7@andestech.com> wrote:

> On Mon, May 06, 2019 at 05:10:56PM +0800, Thomas Petazzoni wrote:
> Hello, Thomas, Baruch, all
> > Hello,
> > 
> > On Mon, 6 May 2019 17:04:11 +0800
> > Nylon Chen <nylon7@andestech.com> wrote:
> >   
> > > Fixes:
> > >   http://autobuild.buildroot.net/results/05ec776548c9bede4878d4c3c43040c5b0aac182
> > >   http://autobuild.buildroot.net/results/24023f2fa3dbf7c281726abdbfd4322badaffbfb
> > > 
> > > Signed-off-by:vincentc <vincentc@andestech.com>  
> Signed-off-by: Vincent Chen <vincentc@andestech.com>
> Signed-off-by: Nylon Chen <nylon7@andestech.com>

Please resend the patch with the correct Signed-off-by, and again with
the commit author matching the *first* Signed-off-by.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
