From: Remi Pommarel <repk@triplefau.lt>
Date: Mon, 2 Nov 2015 09:11:34 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/git: Add needed library for
 static compilation
In-Reply-To: <20151102042520.GM3352@tarshish>
References: <1446410183-7798-1-git-send-email-repk@triplefau.lt>
 <1446410183-7798-2-git-send-email-repk@triplefau.lt>
 <20151102042520.GM3352@tarshish>
Message-ID: <20151102081134.GD13534@cruxbox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi baruch,

On Mon, Nov 02, 2015 at 06:25:20AM +0200, Baruch Siach wrote:
> Hi Remi,
> 
> On Sun, Nov 01, 2015 at 09:36:21PM +0100, Remi Pommarel wrote:
> > @@ -57,7 +57,7 @@ endif
> >  
> >  # assume yes for these tests, configure will bail out otherwise
> >  # saying error: cannot run test program while cross compiling
> > -GIT_CONF_ENV = \
> > +GIT_CONF_ENV += \
> >  	ac_cv_fread_reads_directories=yes \
> >  	ac_cv_snprintf_returns_bogus=yes LIBS='$(GIT_CONF_ENV_LIBS)'
> 
> Please move this hunk to patch #3 in this series, which is where it logically 
> belongs.
> 

I removed the gettext part from v1 because it is not needed anymore with
the git patches. But this hunk escapes my attention.

Thanks.
Remi
