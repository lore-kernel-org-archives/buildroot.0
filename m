From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 16:24:05 +0200
Subject: [Buildroot] [PATCH 4/5] grub2: enable support for arm and
 aarch64 targets
In-Reply-To: <b3a9aff2-aadf-7ef0-6587-b329fed22510@mind.be>
References: <20160913041548.10290-1-nunes.erico@gmail.com>
 <20160913041548.10290-5-nunes.erico@gmail.com>
 <b3a9aff2-aadf-7ef0-6587-b329fed22510@mind.be>
Message-ID: <20160917162405.13cc40dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 14 Sep 2016 02:39:11 +0200, Arnout Vandecappelle wrote:

> >  	  1. Download the EFI BIOS for Qemu
> >  	     Version IA32 or X64 depending on the chosen Grub2  
> 
>  You hinted at this in your cover letter: it would be better to move all this
> documentation to e.g. boot/grub2/readme.txt and refer to it from the help text.
> This would be a separate preparatory patch. Then you can also easily add all the
> documentation for the ARM targets to that file.

Just wanted to say that I agree with the idea of a readme.txt in the
package directory. For quite some time we have been in a need of a
place to store some documentation/informations/details about different
packages, and we currently don't have a good place for that. The
manual? There's no chapter for it, and it puts the information a bit
"far" from the package itself. In the Config.in help text? Works fine
for short text, but not really suitable for longer explanations.

So, +1 for readme.txt in package directories, of course when there's
something useful to say about the package.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
