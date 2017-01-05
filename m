From: Ashish_Kumar_Mishra <dgashu55@gmail.com>
Date: Wed, 4 Jan 2017 21:13:32 -0800 (PST)
Subject: [Buildroot] Kernel Panic with BB Black + buildroot-2016.11.1
In-Reply-To: <87bmvm2303.fsf@dell.be.48ers.dk>
References: <1483536685380-153942.post@n4.nabble.com>
 <87bmvm2303.fsf@dell.be.48ers.dk>
Message-ID: <1483593212540-153987.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

1) So how do you create your rootfs and filesystem image?
I have the directory structure of 
my_virtual_project/git_release_buildroot = Has the buildroot setup 
my_virtual_project/release_branch_v2    =  Its here that i have my $(O)
directory & the steps were 
        *make -C ../git_release_buildroot/buildroot-2016.11.1 O=$(pwd)
menuconfig
        make *
Then flashing the images from ~/my_virtual_project/release_branch_v2/images
                 

2) Does it work if you instead build out beaglebone_defconfig? (E.G. make
clean; make beaglebone_defconfig; make
Initially i had working setup of buildroot-2016.05 where i carried the build
in the same directory .
With buildroot-2016.11.1 , i am trying building externally as per step_1
above. 

3) As you pointed i will try to build the buildroot-2016.11.1 internally
today & share the result. 

Could you please let me know if i am doing any step wrong here or missing
some steps !!!!!




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Kernel-Panic-with-BB-Black-buildroot-2016-11-1-tp153942p153987.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
