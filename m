From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Apr 2013 15:54:23 +0200
Subject: [Buildroot] [PATCH 0/2] Download patches for Busybox
In-Reply-To: <8738ugcvdw.fsf@dell.be.48ers.dk>
References: <1366770167-22834-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <8738ugcvdw.fsf@dell.be.48ers.dk>
Message-ID: <20130424155423.382dc054@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 24 Apr 2013 08:09:31 +0200, Peter Korsgaard wrote:

>  Thomas> Hello,
>  Thomas> As recently discussed on the list, here are two patches that
>  Thomas> let the busybox package download its patches, instead of
>  Thomas> storing them in Buildroot's source tree.
> 
> Thanks. There's one big problem with busybox though. Denys tends to
> update the patches without renaming them if more problems are found in
> those applets - So we end up with different results depending on when
> you build.

Yerk, this is ugly.

> Perhaps we can convince him to do otherwise, but until then I would
> prefer to keep it like it is.

Indeed, in this case, we don't have much choice.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
