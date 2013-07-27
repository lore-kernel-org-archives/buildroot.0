From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 15:47:32 +0200
Subject: [Buildroot] [PATCH] directfb-examples: install rose.png for
 df_dok
In-Reply-To: <1374593638-16863-1-git-send-email-james.hogan@imgtec.com>
References: <1374593638-16863-1-git-send-email-james.hogan@imgtec.com>
Message-ID: <20130727154732.7d96d8f0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Hogan,

On Tue, 23 Jul 2013 16:33:58 +0100, James Hogan wrote:
> The directfb example program df_dok now requires rose.png to be
> installed, otherwise it gives the following error:
> 
> (#) DirectFBError [dfb->CreateImageProvider( dfb, DATADIR"/rose.png", &provider )]: A general or unknown error occured
> 
> Therefore add rose.png to the list of data files if df_dok is enabled.
> 
> Signed-off-by: James Hogan <james.hogan@imgtec.com>
> ---
>  package/directfb-examples/directfb-examples.mk | 1 +
>  1 file changed, 1 insertion(+)

Committed, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
