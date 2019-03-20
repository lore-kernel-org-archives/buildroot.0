From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Mar 2019 22:44:21 +0100
Subject: [Buildroot] [PATCH v5 2/4] boot/opensbi: new package
In-Reply-To: <CAKmqyKP7TfOOOkggSVJdJZVzp3mrOM1Vb9Y-mWQpEPPdrYXjVw@mail.gmail.com>
References: <20190320003706.1126-1-alistair.francis@wdc.com>
 <20190320003706.1126-2-alistair.francis@wdc.com>
 <20190320221236.1ea9c11b@windsurf>
 <CAKmqyKP7TfOOOkggSVJdJZVzp3mrOM1Vb9Y-mWQpEPPdrYXjVw@mail.gmail.com>
Message-ID: <20190320224421.440d3e5a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Mar 2019 14:28:59 -0700
Alistair Francis <alistair23@gmail.com> wrote:

> > I would expect for something related to firmware) or to Linux
> > user-space applications. In the latter case, installing to
> > $(STAGING_DIR)/usr/lib is the right thing to do. In the former case
> > however, it should probably be installed elsewhere, maybe
> > $(STAGING_DIR)/usr/share/opensbi (but I'm not a FHS expert).  
> 
> $(STAGING_DIR)/usr/share/opensbi looks good to me. I will use that.

Then it should go to a OPENSBI_INSTALL_STAGING_CMDS variable, not in
OPENSBI_INSTALL_IMAGES_CMDS.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
