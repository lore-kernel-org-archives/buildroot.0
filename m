From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Nov 2013 23:36:41 +0100
Subject: [Buildroot] [PATCH 4/7] opencv: add eigen dependency
In-Reply-To: <1384203613-17871-5-git-send-email-s.martin49@gmail.com>
References: <1384203613-17871-1-git-send-email-s.martin49@gmail.com>
 <1384203613-17871-5-git-send-email-s.martin49@gmail.com>
Message-ID: <20131111233641.2a5564c5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Mon, 11 Nov 2013 22:00:10 +0100, Samuel Martin wrote:
>  menuconfig BR2_PACKAGE_OPENCV
>  	bool "opencv"
>  	select BR2_PACKAGE_ZLIB
> +	select BR2_PACKAGE_EIGEN

Any reason to make it mandatory?

I'm sorry but I'm going to be a bit angry again. I've asked you many,
many, many times to write more descriptive commit logs. And once again,
several of your patches have just a one line title, with no explanation
whatsoever about *why* you're doing the change.

It would be really nice if you could review all your patches before you
post them, and ask yourself the question: is the reason why I'm doing
this going to be obvious for the reviewer? If the answer is even on the
slightly unsure side, then it means you need to expand with a more
detailed commit log, or more comments in the code.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
