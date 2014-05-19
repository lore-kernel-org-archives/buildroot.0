From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 May 2014 08:43:02 +0200
Subject: [Buildroot] Problems building for Olimex A13. A new user
 enquires ...
In-Reply-To: <09d801cf72fa$f6cc2c40$e46484c0$@novadsp.com>
References: <09d801cf72fa$f6cc2c40$e46484c0$@novadsp.com>
Message-ID: <20140519084302.1a0259f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 May 2014 01:40:42 +0100, g4 at novadsp.com wrote:

> --------------------------snip------------------------------
> make[1]: Leaving directory `/home/jevans/olimex/buildroot'
> >>> uboot  Downloading

There is no U-Boot version specified. I'd say your Buildroot
configuration might be wrong.

> Doing shallow clone
> Cloning into 'uboot-'...
> warning: Could not find remote branch --bare to clone.
> fatal: Remote branch --bare not found in upstream origin
> Unexpected end of command stream
> Doing full clone
> Cloning into bare repository 'uboot-'...
> remote: Reusing existing pack: 261244, done.
> remote: Counting objects: 52, done.
> remote: Compressing objects: 100% (52/52), done.
> remote: Total 261296 (delta 29), reused 2 (delta 0)
> Receiving objects: 100% (261296/261296), 72.68 MiB | 228.00 KiB/s, done.
> Resolving deltas: 100% (205455/205455), done.
> Checking connectivity... done.
> usage: git archive [options] <tree-ish> [<path>...]

Which /might/ explain why git archive is failing (but not sure).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
