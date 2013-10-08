From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Oct 2013 17:48:02 +0200
Subject: [Buildroot] [PATCH 1/2] stress: fix download url
In-Reply-To: <874n8r7p1m.fsf@dell.be.48ers.dk>
References: <1381200229.18302.0.camel@phoenix>
 <874n8r7p1m.fsf@dell.be.48ers.dk>
Message-ID: <20131008174802.2c023331@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 08 Oct 2013 17:36:21 +0200, Peter Korsgaard wrote:

> The new tarball has a bunch of binary .-files, and COPYING is GPL3
> instead of GPL2:
> 
> diff -u 1/stress-1.0.4/COPYING 2/stress-1.0.4/COPYING|head                                          /tmp/i
> --- 1/stress-1.0.4/COPYING	2010-03-19 08:21:09.000000000 +0100
> +++ 2/stress-1.0.4/COPYING	2010-03-24 00:34:05.000000000 +0100
> @@ -1,622 +1,281 @@
>                      GNU GENERAL PUBLIC LICENSE
> -                       Version 3, 29 June 2007
> +                       Version 2, June 1991
>  
> - Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
> + Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
> + 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
> 

You mean the new tarball has a GPLv2 COPYING instead of GPLv3. This was
precisely was originally triggered the discussion: the package source
code and web site was saying GPLv2, but the COPYING was saying GPLv3.

Axel contacted the author, who replaced the COPYING by a GPLv2 one,
which is ok.

Obviously, all the other files look strange, but the COPYING change is
intentional.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
