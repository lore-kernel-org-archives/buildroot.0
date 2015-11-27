From: Alexey Galakhov <agalakhov@gmail.com>
Date: Fri, 27 Nov 2015 16:20:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/boost: bump to version 1.59.0
In-Reply-To: <87oaefskj5.fsf@dell.be.48ers.dk>
References: <1448552157-1394-1-git-send-email-agalakhov@gmail.com>
 <87oaefskj5.fsf@dell.be.48ers.dk>
Message-ID: <1448637625.2038.39.camel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Freitag, den 27.11.2015, 13:18 +0100 schrieb Peter Korsgaard:
> > > > > > "Alexey" == Alexey Galakhov <agalakhov@gmail.com> writes:
> 
> ?> Removed boost patches that are already updtream.
> 
> What about the known issue / new libraries in 1.59?
> 
> See my reply to Bernd's recent patch doing the same bump:
> 
> https://patchwork.ozlabs.org/patch/547228/

Thank you for pointing me at this issue. I'll make a backport of the
fix since it is fixed in git.

(boost 1.58 is not better, we made this bump due to the bug #11222 of
1.58).

Regards,
Alexey
