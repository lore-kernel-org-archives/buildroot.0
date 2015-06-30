From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 14:12:59 +0200
Subject: [Buildroot] [PATCH v2] configs/acmesystems_aria_g25: new configs
In-Reply-To: <55927C79.1080700@zacarias.com.ar>
References: <1435613937-20746-1-git-send-email-gustavo@zacarias.com.ar>
 <CA+TH9Vkn625DJy8xzD-WCSZMpbPF_jE2C_eZ_jnVSfNFRv7NcA@mail.gmail.com>
 <55927C79.1080700@zacarias.com.ar>
Message-ID: <20150630141259.4659759c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 30 Jun 2015 08:24:41 -0300, Gustavo Zacarias wrote:

> > echo ',32,6\n;' | sfdisk -uM /dev/sdX
> 
> I've used the xplained readme as basis.
> Ideally we should script this thing up, probably making a somewhat 
> generic one that takes parameters from an image file defined in the BR 
> config.

No, we should use genimage:

  http://patchwork.ozlabs.org/patch/462195/

But that's longer term. For now, I'm fine with a script.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
