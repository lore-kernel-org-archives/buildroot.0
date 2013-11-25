From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 25 Nov 2013 10:26:46 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-11-22
In-Reply-To: <20131123182656.77936e93@skate>
References: <20131123073002.EA89E101432@stock.ovh.net>
 <CAAXf6LWFAGDvHV42Mvc2_uhnFtthuCX-N5ZLogdW5u1k9XSkSQ@mail.gmail.com>
 <20131123182656.77936e93@skate>
Message-ID: <CAAXf6LVk0j9C0GS=qUeEdcyKvB64vc4AEPPHBptnSFtdVX5ukw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Nov 23, 2013 at 6:26 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Sat, 23 Nov 2013 14:11:43 +0100, Thomas De Schampheleire wrote:
>
>> >        arm |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/e5484bcdcca7f2cb48913d65271de4b957ea3450/
>
> It's a fairly old toolchain that I've built with Crosstool-NG. It uses
> uClibc 0.9.33.2, but there might be some missing uClibc configuration
> options, or the kernel headers might be old.

Then what do we do? Does it make sense to use this old toolchain, or
should we update it?

Thanks,
Thomas
