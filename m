From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Tue, 12 Aug 2008 01:48:57 -0700 (PDT)
Subject: [Buildroot] Building Cairo using DirectFB
In-Reply-To: <1218467304.18656.19.camel@localhost.localdomain>
References: <1218467304.18656.19.camel@localhost.localdomain>
Message-ID: <18940236.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I have built cairo with DirectFB support.  
It all works fine however I have bounced version to 1.6.4 maybe that will
solve it for you.

Cheers
Dan laird


Ormund Williams wrote:
> 
> Hi,
> 
> It seems that DirectFB puts its header files in:
> 	..staging_dir/usr/include/directfb/
> but Cairo is looking for them in:
> 	..staging_dir/include/directfb/
> 
> Actually, ..staging_dir/include/ doesn't exist, so how do I get Cairo to
> look in the right place?
> 
> __
> Ormund
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
> 

-- 
View this message in context: http://www.nabble.com/Building-Cairo-using-DirectFB-tp18927643p18940236.html
Sent from the BuildRoot mailing list archive at Nabble.com.
