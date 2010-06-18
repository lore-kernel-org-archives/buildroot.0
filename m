From: Ossy <ossy1980@gmx.net>
Date: Fri, 18 Jun 2010 23:29:01 +0200
Subject: [Buildroot] uImage could not be built before and after big
	bootloader patch
Message-ID: <4C1BE51D.5040406@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear mailinglist,

I am still not able to make a U-Boot image (uImage) of the linux kernel 
if I use "Same version as kernel headers". U-Boot is built before trying 
to make the uImage, but it still gives the following error:

...
"mkimage" command not found - U-Boot images will not be built
...

Am I forced to install U-Boot (meaning mkimage) on the host?
This is not neccessary if using "Advanced configuration".


Kind regards,
Marcus


ossy at debian-virtual:~/buildroot/buildroot-dev$ cat .git/FETCH_HEAD
1e627bf212afff670e414d3ebfc8fb4c4b31c318                branch 'master' 
of http://git.buildroot.net/buildroot
