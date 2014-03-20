From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 Mar 2014 18:56:07 +0100
Subject: [Buildroot] [PATCH] manual: Add Section on using Buildroot's
 Toolchain Externally
In-Reply-To: <20140320025844.12fa4f78@skate>
References: <1395273466-19365-1-git-send-email-alan@signal11.us>
 <20140320025844.12fa4f78@skate>
Message-ID: <20140320175607.GB23560@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Alan, All,

On 2014-03-20 02:58 +0100, Thomas Petazzoni spake thusly:
> On Wed, 19 Mar 2014 19:57:46 -0400, Alan Ott wrote:
> > Signed-off-by: Alan Ott <alan@signal11.us>
> > ---
> >  docs/manual/customize-toolchain.txt | 30 ++++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> > 
> > diff --git a/docs/manual/customize-toolchain.txt b/docs/manual/customize-toolchain.txt
> > index 31c9140..71687d3 100644
> > --- a/docs/manual/customize-toolchain.txt
> > +++ b/docs/manual/customize-toolchain.txt
> > @@ -49,3 +49,33 @@ It allows to tune major settings, such as:
> >  
> >  These settings are available after selecting the +Buildroot toolchain+ type in
> >  the menu +Toolchain+.
> > +
> > +Using a Buildroot Toolchain from Outside Buildroot
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> Thanks a lot for this contribution. However, the manual already has a
> section about this topic, see:
> 
>   http://buildroot.org/downloads/manual/manual.html#_using_the_generated_toolchain_outside_buildroot

Doh, I missed it when looking at the manual. :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
