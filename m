From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Oct 2013 12:22:07 -0300
Subject: [Buildroot] [PATCH] uboot-tools: fix license issues
In-Reply-To: <CAAXf6LW3ob7ev6VBpG3ajRR=aMSdgN0mM=O7a7wX2+cLd6fRBA@mail.gmail.com>
References: <1382452676-2514-1-git-send-email-gustavo@zacarias.com.ar>
 <CAAXf6LW3ob7ev6VBpG3ajRR=aMSdgN0mM=O7a7wX2+cLd6fRBA@mail.gmail.com>
Message-ID: <5266981F.4030906@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/22/2013 11:57 AM, Thomas De Schampheleire wrote:

> Maybe the legal-info target should warn for non-existing files, rather
> than error out.
> It seems more logical to support the latest versions than to support
> none, with respect to _LICENSE_FILES.
> Those who build older versions of u-boot should see the warning and
> handle it appropriately.

Yes, that's what i thought, this is the quick fix but maybe not the
desired one.

> Note that in either case, we can't trust the _LICENSE directive
> either: a project could change license along the way, and if buildroot
> allows to select an arbitrary version in the config, the specified
> LICENSE may be wrong.

Looking at Licenses/README in 2013.10 it seems there was some licensing
cleanup done and not all the code is guaranteed to be GPLv2*.
It's mostly accurate for uboot-tools but may not be so for target u-boot
(which isn't covered by this issue, just bringing up the details here).
Regards.
