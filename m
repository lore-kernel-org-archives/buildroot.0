From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Fri, 27 Jun 2008 02:05:34 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
In-Reply-To: <877iccn0ml.fsf@macbook.be.48ers.dk>
References: <20080626065112.3F4CB3C289@busybox.net>
	<877iccn0ml.fsf@macbook.be.48ers.dk>
Message-ID: <18151015.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




jacmet wrote:
> 
>>>>>> "jacmet" == jacmet  <jacmet@uclibc.org> writes:
> 
>  jacmet> Author: jacmet
>  jacmet> Date: 2008-06-25 23:51:11 -0700 (Wed, 25 Jun 2008)
>  jacmet> New Revision: 22514
> 
>  jacmet> Log:
>  jacmet> busybox: mark old versions as deprecated
> 
> I would like to get rid of the ancient 1.2.1 .. 1.8 versions - Any
> objections to me removing them completely?
> 
> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
> 
I use buildroot actively in my company and have kept up to date pretty well.  
However we are still using busybox 1.2.2.1 in some cases.  Marking as
deprecated is fine, removing completely would mean me having to hold local
patches to keep the ability to upgrade buildroot yet not change busybox
versions.

So I vote for not removing just deprecating :-)

Cheers
Dan

-- 
View this message in context: http://www.nabble.com/svn-commit%3A-trunk-buildroot-package-busybox-tp18127574p18151015.html
Sent from the BuildRoot mailing list archive at Nabble.com.
