From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 16 Oct 2019 00:55:44 +0200
Subject: [Buildroot] [RFC PATCH 2/4] ti-sgx-*: bump to latest TI version
In-Reply-To: <20191015213101.27460-2-lothar.felten@gmail.com>
References: <20191015213101.27460-1-lothar.felten@gmail.com>
 <20191015213101.27460-2-lothar.felten@gmail.com>
Message-ID: <494e3898-d59d-cafd-b3e8-267ca01be579@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/10/2019 23:30, Lothar Felten wrote:
> bump the ti-sgx-km,-um and -demos to the TI version that matches
> the TI SDK 06.00.00.07.
> 
> Removed all targets except AM335x.
> powervr.ini is no longer used in the TI SDK, remove it too.

 So TI provides no SDK any more for any other CPU with PowerVR? This is a bit
annoying... If there are any users out there with such a system, they won't be
able to build with Buildroot any more.

 Well, they can always take the old ti-sgx-km package in a BR2_EXTERNAL, I guess...

 Peter, Thomas, opinions?

 Regards,
 Arnout
