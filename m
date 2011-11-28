From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 28 Nov 2011 21:48:11 +0100
Subject: [Buildroot] [Bug ] 2011.11rc3 On 64bit Linux Dev Machine armeb
	builds libs to lib64 dir
In-Reply-To: <zarafa.4ed3c000.2af5.444b2d795dbc1c99@jedmail.edag.de> (Peter
 Katzmann's message of "Mon, 28 Nov 2011 18:08:16 +0100")
References: <zarafa.4ed3c000.2af5.444b2d795dbc1c99@jedmail.edag.de>
Message-ID: <874nxo3rec.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Katzmann <peter.katzmann@edag.de> writes:

 Peter> Hello,
 Peter> i have a OpenSuse 12.1 64 Bit dev machine and building an armeb tree.
 Peter> Now when tries to build mtd:
 Peter> /usr2/new/Source-ast18/build_env/buildroot/project_build_armeb/host/usr/lib64/gcc/armeb-unknown-linux-uclibcgnueabi/4.6.2/../../../../armeb-unknown-linux-uclibcgnueabi/bin/ld: cannot find -llzo2
 Peter> collect2: ld returned 1 exit status

More details please. What is your .config exactly?

I just did a quick test build with the following configuration which
built without problems:

BR2_armeb=y
BR2_arm926t=y
BR2_PACKAGE_MTD=y

-- 
Bye, Peter Korsgaard
