From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Fri, 11 Jan 2008 15:08:57 +0200
Subject: [Buildroot] tslib build error
In-Reply-To: <47875526.5090103@carallon.com>
References: <47875526.5090103@carallon.com>
Message-ID: <47876A69.70804@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will Wagner wrote:
> Hi All,
> 
> I'm having a build error when trying to build tslib. Attached is the 
> error. The thing that is confusing me is that I have managed to make it 
> build on one of the machines we have here but I now need to get it 
> building on a second and there I get this error. They are both debian 
> lenny boxes with similar but not identical packages installed.
> 
> Can anyone tell me if I am missing a package or I need some environment 
> variable?
> 
> Any help tracking this down is much appreciated.
> 
> Will.
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

Hi,

Think you have to install libtool package.

Regards,
Ivan
-- 

--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
