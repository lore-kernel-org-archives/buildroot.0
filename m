From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Nov 2016 23:31:56 +0100
Subject: [Buildroot] Buildroot error
In-Reply-To: <D3FA0BA2E2AD54469423D3A670F43027238ED805@mail.protoprod.local>
References: <D3FA0BA2E2AD54469423D3A670F43027238ED2AB@mail.protoprod.local>
 <8dee00da-0ff9-66de-2baf-c0b1f39dc96e@mind.be>
 <20161115224708.043f0c31@free-electrons.com>
 <D3FA0BA2E2AD54469423D3A670F43027238ED805@mail.protoprod.local>
Message-ID: <20161117233156.7b5858bb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Nov 2016 17:38:22 +0000, Michael Brainerd wrote:

> Then there is no way to specify uClinux as the image to build?

What are you trying to do exactly? For which architecture/platform are
you trying to build a kernel?

uClinux is pretty much useless these days, both common noMMU
architectures are supported by the regular Linux kernel.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
