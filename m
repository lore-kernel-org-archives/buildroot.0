From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Apr 2018 17:57:38 +0200
Subject: [Buildroot] [PATCH v2/next 3/4] webkitgtk: update to version
 2.20.0
In-Reply-To: <20180410165409.GD19381@momiji>
References: <20180323185942.60252-1-aperez@igalia.com>
 <20180323185942.60252-4-aperez@igalia.com>
 <87po3t21cy.fsf@dell.be.48ers.dk>
 <20180410095327.59c0e9d8@windsurf> <20180410165409.GD19381@momiji>
Message-ID: <20180410175738.40345498@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Apr 2018 16:54:09 +0100, Adrian Perez de Castro wrote:

> The change for AArch64 is just listing BR2_aarch64 in WEBKITGTK_ARCH_SUPPORTS,
> the addition is in the first patch.

Then the following paragraph that you wrote:

   This series starts with the same three patches as the previous
   submission, and adds on top three additional commits to make
   WebKitGTK+ available on AArch64 (it's a platform we support
   upstream), and adds a couple of patches which are already merged in
   the upstream repository, but are not in the release and are worth
   applying.

is a bit unclear. You're saying "adds on top three additional commits
to make WebKitGTK+ available on AArch6". What those three additional
commits ?

For the record, your patch series was:

  brotli: new package
  woff2: new package
  webkitgtk: update to version 2.20.0
  webkitgtk: Add upstream patch for better memory monitoring

> Anyway, I was waiting a bit until the 2.20.1 release, which just happened:
> 
>   https://webkitgtk.org/2018/04/10/webkitgtk2.20.1-released.html
> 
> Updating to 2.20.1 directly is IMHO better because it includes the fix for
> building with multimedia disabled, and a fix to improve memory consumption
> on devices with smaller amounts of memory ? which is particularly welcome
> for embedded :-)
> 
> I'm making a test build with 2.20.1 as I wrote this mail, if all goes well
> the new patch set will supersede this one.

OK, thanks. Some clarification about the above would be nice. Perhaps
it was just a mistake in your cover letter ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
