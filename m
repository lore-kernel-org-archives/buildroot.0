From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 19 Sep 2011 08:54:29 +0200
Subject: [Buildroot] [git commit] boot: get rid of toplevel submenus
In-Reply-To: <20110919084606.7ff12ec8@skate> (Thomas Petazzoni's message of
 "Mon, 19 Sep 2011 08:46:06 +0200")
References: <20110918210214.501348D5CD@busybox.osuosl.org>
 <20110919084606.7ff12ec8@skate>
Message-ID: <87vcsp58ey.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Sub options are indented anyway, so no need for empty menus / force
 >> people to enter sub menus to see configuration options.

 Thomas> My preference was the old way. Even if suboptions are indented,  I
 Thomas> think it's a mess in menuconfig to have the U-Boot suboptions in the
 Thomas> middle of the bootloader list.

I find the empty submenus when E.G. u-boot isn't enabled pretty ugly,
and use of a normal config is by far the most used option - E.G:

git grep '^menuconfig '|wc -l
10

Out of ~700 packages, bootloaders, filesystems, ..

-- 
Bye, Peter Korsgaard
