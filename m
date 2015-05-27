From: Peter Bouda <pbouda@cidles.eu>
Date: Wed, 27 May 2015 15:11:20 +0100
Subject: [Buildroot] [PATCH 1/1] Removed Python dependency from
	python-pygame package. With the dependency,
	it was only possible to build the package with Python 2. Without the
	dependency it is now possible to also use Python 3.
In-Reply-To: <CAMQcK5Ly-s1_LVrTJRgmu-0eEbJuw7om_Kw-dNLJBN0yrEMK0A@mail.gmail.com>
References: <1432561909-15488-1-git-send-email-pbouda@cidles.eu>
 <CAMQcK5Ly-s1_LVrTJRgmu-0eEbJuw7om_Kw-dNLJBN0yrEMK0A@mail.gmail.com>
Message-ID: <5545931.sRUYvYoo9D@pbouda-kubuntu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan,

thanks for the comment, I will resubmit.

Best,
Peter

Am Mittwoch 27 Mai 2015, 08:33:22 schrieb Ryan Barnett:
> Hi Peter,
> 
> On Mon, May 25, 2015 at 8:51 AM, Peter Bouda <pbouda@cidles.eu> wrote:
> 
> The title (subject) of a commit is usually limited to less than 70
> characters. The body of the commit message should also be no longer
> than 70 characters as well.
> 
> If you don't mind resubmitting this patch with a title and subject as
> follows:
> 
> python-pygame: remove python dependency
> 
> With the dependency on BR2_PACKAGE_PYTHON it was only possible to
> build the package with python2. However, python-pygame works with
> python3 so enable it to be built with it.
> 
> > Signed-off-by: Peter Bouda <pbouda@cidles.eu>
> > ---
> > 
> >  package/python-pygame/Config.in | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/package/python-pygame/Config.in
> > b/package/python-pygame/Config.in index f72ee31..932b0f1 100644
> > --- a/package/python-pygame/Config.in
> > +++ b/package/python-pygame/Config.in
> > @@ -1,6 +1,5 @@
> > 
> >  config BR2_PACKAGE_PYTHON_PYGAME
> >  
> >         bool "python-pygame"
> > 
> > -       depends on BR2_PACKAGE_PYTHON
> > 
> >         select BR2_PACKAGE_SDL
> >         help
> >         
> >           Pygame is a cross-platfrom library designed to make it easy to
> >           write
> 
> Thanks,
> -Ryan

-- 
Peter Bouda
Centro Interdisciplinar de Documenta??o Lingu?stica e Social
http://www.cidles.eu/

E-Mail: pbouda at cidles.eu
Website: http://www.cidles.eu/about/team/peter-bouda/
Skype: peter.bouda
Phone: +351 917 403 181
