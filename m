From: Steve Calfee <nospamcalfee@yahoo.com>
Date: Thu, 9 Dec 2010 22:46:42 -0800 (PST)
Subject: [Buildroot] skeleton updates
In-Reply-To: <da8a618d7ebd5da7e48fccbab506f3e7b7a5cdd8.1291582351.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
	<da8a618d7ebd5da7e48fccbab506f3e7b7a5cdd8.1291582351.git.thomas.petazzoni@free-electrons.com>
Message-ID: <158894.53583.qm@web58205.mail.re3.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guys,

I am trying to follow up with Marcus Osdoba's work on dockstar and get something 
ready to submit to buildroot.

I am having a real problem figuring out how stuff makes it into the the final 
etc directory. My patch script in the 
target/device/sheevaplug/SeagateDockStar/patchrootfs.sh copies new files 
(inittab and shadow into output/target/skeleton/etc/ and this happens on 
re-invocation of make. However when I look at the rootfs.tar file the updated 
inittab is not there. Can anyone describe how the various /etc/ files in 
fs/skeleton and target/device/...skeleton and the final patch file get to the 
final output image files.

Thanks, Steve



      
