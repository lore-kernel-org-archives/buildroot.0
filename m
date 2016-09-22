From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Date: Thu, 22 Sep 2016 18:43:29 +0530
Subject: [Buildroot] Update of pre-built Buildroot toolchains
In-Reply-To: <20160921210722.1b078ab1@free-electrons.com>
References: <20160921210722.1b078ab1@free-electrons.com>
Message-ID: <57E3D8F9.4020109@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thursday 22 September 2016 12:37 AM, Thomas Petazzoni wrote:
> Hello,
>
> I have just deployed a new set of pre-build Buildroot toolchains in the
> autobuilders. The toolchains have all been rebuilt as of commit
> 589cbc61b0913891fd00019365e52b9e50ff7250. Major changes are:
>
>   * Almost all toolchains have been switched to the default of gcc 5.x.
>     There are still a few toolchains that intentionally use different
>     gcc version: some using gcc 6.x, some using gcc 4.8.x.
>
>   * The ARC toolchain has been updated with the latest version of the
>     ARC toolchain components.
>
>   * The Blackfin toolchain has the latest uClibc fix.

It looks like bfin config on autobuilder is not updated to use new 
pre-build toolchain.

Regards,

Rahul
