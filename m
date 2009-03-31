From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2009 01:28:41 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain: binutils
 external-toolchain gcc uClibc
In-Reply-To: <d6cda7730903301256r2e9adf8bmf613118daf62eb61@mail.gmail.com>
References: <20090130162827.2A05D765E9@busybox.osuosl.org>
	<20090330153259.0a7ee398@surf> <87ab73azsj.fsf@macbook.be.48ers.dk>
	<20090330175842.1960fed2@surf> <87prfyald1.fsf@macbook.be.48ers.dk>
	<d6cda7730903301256r2e9adf8bmf613118daf62eb61@mail.gmail.com>
Message-ID: <20090401012841.585dc38e@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 30 Mar 2009 16:56:54 -0300,
Thiago A. Corr?a <thiago.correa@gmail.com> a ?crit :

> Would that be a bad thing? Even if it's not integrated but a script,
> say: ./script/fix-external-toolchain.sh
> 
> Before/after running kconfig.
> 
> It beats having the user to guess or remember.

Or maybe we could just *not* show these options, and let a script
auto-detect the values. For uClibc, they can easily be guessed from
some uClibc-config.h script available in the toolchain.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
