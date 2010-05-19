From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 May 2010 12:15:53 +0200
Subject: [Buildroot] change of staging_dir paths ?
In-Reply-To: <2040226006DA4CF38CBF75F437EF92EC@apexjs>
References: <2040226006DA4CF38CBF75F437EF92EC@apexjs>
Message-ID: <20100519121553.1f26cf56@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 19 May 2010 12:06:31 +0200
"Sagaert Johan" <sagaert.johan@skynet.be> wrote:

> I am currently using the 2010.05rc2 (before i used 2010.02)
>  
> I noticed that the path to the tools no longer is  
>  
> buildroot/output/build/staging_dir/usr/bin
>  but  now is
> buildroot/output/staging/usr/bin  
>  
> Has this changed in 2010.05rc2 ? 

No, it has changed since 2009.08.

> My path was still pointing to 
> buildroot/output/build/staging_dir/usr/bin
> but changing it to buildroot/output/staging/usr/bin   did not fix my problem
> building QT (still sooms tu use /usr/bin/ld of my host )

Your QT building problem is probably not related to this staging
directory change.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
