From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Jun 2013 10:08:02 +0200
Subject: [Buildroot] [PATCH] system/permissions: make /root group+others
 non-writable
In-Reply-To: <1371939752-29205-1-git-send-email-yann.morin.1998@free.fr>
References: <1371939752-29205-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20130623100802.652eac9d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 23 Jun 2013 00:22:32 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Upon logging, dropbear whines if /root is group- or others-writable, and
> key-based authentication is attempted, reverting to password-based
> authentication:
>     dropbear[149]: /root must be owned by user or root, and not writable by others
>     dropbear[149]: Password auth succeeded for 'root' from 192.168.127.35:41566
> 
> On my system, /root was 770. Changing to 700 fixed the issue.
> 
> Having /root 700 is a good idea, anyway.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
