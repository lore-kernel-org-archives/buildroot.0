From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Apr 2015 09:16:47 +0200
Subject: [Buildroot] Naming convention for patches
In-Reply-To: <CAJtjsKaG8QfL5ZHcZ7osJ0+T=eJTFgHxhCfqe=QWBDHa0z9q0w@mail.gmail.com>
References: <CAJtjsKaG8QfL5ZHcZ7osJ0+T=eJTFgHxhCfqe=QWBDHa0z9q0w@mail.gmail.com>
Message-ID: <20150402091647.06db2ee5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

On Thu, 26 Mar 2015 17:57:43 +0100, Johan Oudinet wrote:

> In 9.8. Adding project-specific patches:
> "Otherwise, patch files matching <packagename>-*.patch are applied in
> alphabetical order."
> 
> This naming convention has been changed in buildroot, so we can use
> the name provided by git format-patch (i.e., without prefixing it by
> the package name).
> Is this pattern still required for patches inside
> BR2_GLOBAL_PATCH_DIR, or is it simply a mistake from the
> documentation?

This is a mistake, and I've sent a patch that fixes it:

  http://patchwork.ozlabs.org/patch/455879/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
