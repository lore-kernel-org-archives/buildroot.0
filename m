From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 20 Sep 2018 15:44:54 -0500
Subject: [Buildroot] [PATCH 13/14] package/alljoyn-base: URL update
In-Reply-To: <20180920220404.77a13cdd@windsurf>
References: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1537449899-9576-13-git-send-email-matthew.weber@rockwellcollins.com>
 <20180920220404.77a13cdd@windsurf>
Message-ID: <CANQCQpZcd3ZXHtTDaDY-OvabUXdM-42szeBA=ynX=hvxyL7ezg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas/Fabrice,

On Thu, Sep 20, 2018 at 3:05 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Thu, 20 Sep 2018 08:24:58 -0500, Matt Weber wrote:
> > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> > ---
> >  package/alljoyn-base/Config.in | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/package/alljoyn-base/Config.in b/package/alljoyn-base/Config.in
> > index 8556d66..c89cb20 100644
> > --- a/package/alljoyn-base/Config.in
> > +++ b/package/alljoyn-base/Config.in
> > @@ -17,7 +17,7 @@ config BR2_PACKAGE_ALLJOYN_BASE
> >         devices, providing a set of interfaces for different devices
> >         to interact and interoperate with one another.
> >
> > -       https://allseenalliance.org
> > +       https://github.com/alljoyn/alljoyn.github.com/wiki
>
> For PATCH 13/14 (this one) and PATCH 14/14, I'd like something a bit
> better:
>
>  - The .mk files still use a mirror of allseenalliance at kernel.org,
>    it should be changed to use the Github location instead.

I don't have a good use case to runtime test making this change.  I
can make it an verified the build is still good.

>
>  - You changed alljoyn-base and alljoyn-tcl-base, but not alljoyn-tcl

I'll have to check, my script may have a bug.  My grep is coming back
showing I missed the plain alljoyn too.
alljoyn-base        https://github.com/alljoyn/alljoyn.github.com/wiki
alljoyn                https://allseenalliance.org
alljoyn-tcl-base    https://github.com/alljoyn/alljoyn.github.com/wiki
alljoyn-tcl            https://allseenalliance.org

>
>  - The commit title should be "update upstream URL"

Noted.

>
>  - The commit log should contain some details, at least explaining that
>    allseenalliance.org is dead, and that the project was moved to
>    Github, etc.

Sure, I'm not to familiar with this one but I can at least state that.

Matt
