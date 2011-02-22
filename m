From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Feb 2011 23:20:56 +0100
Subject: [Buildroot] Errors using buildroot-2010.11 on Fedora 14 x86_64
In-Reply-To: <AANLkTikMr6bW=CpEH5RTq+jAm+Kd8K7YCLdDtY5E23yE@mail.gmail.com>
	(Steve Johnson's message of "Tue, 22 Feb 2011 12:10:32 -0800")
References: <AANLkTikMr6bW=CpEH5RTq+jAm+Kd8K7YCLdDtY5E23yE@mail.gmail.com>
Message-ID: <87y657n22f.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Steve" == Steve Johnson <sjohnson228@gmail.com> writes:

 Steve> I get the following error when I try to use buildroot (this is
 Steve> the end of the output):

 Steve> echo 2010.11 > /home//projects/embeddedlinux/test1/build-tools/
 Steve> buildroot-2010.11/output/target/etc/br-version
 Steve> rm -f /home//projects/embeddedlinux/test1/build-tools/buildroot-2010.11/output/
 Steve> build/.fakeroot*

I don't see any errors. From this output it just looks as if you didn't
enable any output images (make menuconfig -> Target filesystem options).

The warnings / ignored errors above are expected (depending on what
packages are enabled).

-- 
Bye, Peter Korsgaard
