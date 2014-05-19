From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 May 2014 00:09:20 +0200
Subject: [Buildroot] how to assign cpp and c++ in buildroot?
In-Reply-To: <5F503FD3-3FBC-4ADB-9D17-BA0CB5606B6D@gmail.com>
References: <52E9D80E-B9AD-417A-BC0F-66A69C39FC21@gmail.com>
 <5F503FD3-3FBC-4ADB-9D17-BA0CB5606B6D@gmail.com>
Message-ID: <20140520000920.20ae6b5b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear cem akpolat,

On Mon, 19 May 2014 23:48:21 +0200, cem akpolat wrote:

> > Since many days I have been trying to compile build root, however,  I encounter nearly each time the sanity check failure due to the misinterpretation of cpp. cpp is pretended as c++, however this is of course not true. When I compile through make command, I see also in the make parameters that cpp 
> > refers to g++ under /host/usr/bin/?. There is clearly something wrong. I wanted to compile only the related packet, bridge-utils, under output/built/bridge-utils by providing the accurate CPP path, there is no problem while configuring and compiling the file. Briefly, how can I say the accurate path of CPP to build root such as make CPP=/path/to/file.
> > 
> > One remark, the name of the packet isn?t significant here, since I saw a lot of different packets which gave the same ?sanity check? error.

Could you post: the Buildroot version you're using, the
Buildroot .config file you're using, and the last ~200 lines of the
build output showing the error you're seeing?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
