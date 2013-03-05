From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Mar 2013 05:37:33 +0100
Subject: [Buildroot] [PATCH 2/2 V5] nodejs: new package
In-Reply-To: <51351B46.2070704@lucaceresoli.net>
References: <1362102967-10236-1-git-send-email-daniel.price@gmail.com>
 <20130304221946.6c6d62cd@skate>
 <201303042257.42979.yann.morin.1998@free.fr>
 <51351B46.2070704@lucaceresoli.net>
Message-ID: <20130305053733.3316df0b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Mon, 04 Mar 2013 23:08:06 +0100, Luca Ceresoli wrote:

> unavoidably incomplete.
> 
> So, I would to the least write:
> 
> NODEJS_LICENSE = MIT and others
> but Yann's proposal is much more informative.

I agree that Yann's proposal is much more informative. "others" is very
vague. Knowing that the "other" licenses are BSD-like tells the user
that the entire nodejs stuff is under a non-copyleft license, which is
quite important.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
