From: Nataraj S Narayan <natarajsn@gmail.com>
Date: Sat, 24 Apr 2010 07:30:11 +0000
Subject: [Buildroot] uclibc / glibc rfs issues
In-Reply-To: <87ocha5s1z.fsf@macbook.be.48ers.dk>
References: <j2n630286c71004230401i8b185fd2jd5fa0a5465b577f@mail.gmail.com>
	<87ocha5s1z.fsf@macbook.be.48ers.dk>
Message-ID: <j2s630286c71004240030z4d6a6cfftad29674b4d4827c0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jacmet

When I try the external Codesourcery tool chain on * v2010.02 branch, I get

cp -dpRf package/config/buildroot-config
/home/noy/buildroot/output/build/buildroot-config
Checking external toolchain settings
Incorrect selection of the C library
make: *** [/home/noy/buildroot/output/stamps/ext-toolchain-installed] Error 255


Does that mean latest stable won't work for external toolchain?

regards

Nataraj


On Fri, Apr 23, 2010 at 11:25 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Nataraj" == Nataraj S Narayan <natarajsn@gmail.com> writes:
>
> ?Nataraj> TCP cubic registered
> ?Nataraj> NET: Registered protocol family 17
> ?Nataraj> VFS: Mounted root (jffs2 filesystem) on device 31:0.
> ?Nataraj> Freeing init memory: 136K
> ?Nataraj> g_ether gadget: full speed config #1: CDC Ethernet (ECM)
> ?Nataraj> mount: mounting none on /proc failed: No such file or directory
>
> Sounds like you don't have a /proc directory in your rootfs.
>
> --
> Bye, Peter Korsgaard
>
