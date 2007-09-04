From: Babarovic Ivica <ivica.babarovic@asist.si>
Date: Wed, 05 Sep 2007 00:41:07 +0200
Subject: [Buildroot] Tar problems
In-Reply-To: <20070904221636.GA11697@aon.at>
References: <46DD5C95.3060907@asist.si> <20070904205625.GV11697@aon.at>
	<46DDD286.80505@asist.si> <20070904221636.GA11697@aon.at>
Message-ID: <46DDDF03.2040200@asist.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:

>
>What revision are you using?
>  
>
$ svn update
At revision 19784.

>What patches do you have applied, if any?
>  
>
No external patches.

>$ svn diff | diffstat -up0
>  
>
$ svn diff | diffstat -up0
 0 files changed

>and
>ls -las
>/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/uclibc/_fakeroot.rootfs.powerpc.ext2
>
>and please show me the contents of that file
>
>  
>
$ ls -las
/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/uclibc/_fakeroot.rootfs.powerpc.ext2
ls: cannot access
/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/uclibc/_fakeroot.rootfs.powerpc.ext2:
No such file or directory

I guess this file gets deleted somehow in the process. 

-- 
Babarovic Ivica, R&D Engineer
ASIST avtomatizacija sistemov d.o.o.		Web: www.asist.si
Cesta Ljubljanske brigade 23a			Phone: +386 (1)5837 217
Ljubljana, Slovenija
