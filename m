From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 20 Sep 2018 15:05:46 -0500
Subject: [Buildroot] [PATCH 10/14] package/glibc: URL update
In-Reply-To: <20180920213028.3f4efbfe@windsurf>
References: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1537449899-9576-10-git-send-email-matthew.weber@rockwellcollins.com>
 <20180920213028.3f4efbfe@windsurf>
Message-ID: <CANQCQpY0V7XxgUWH-PKPzsGUMN3DG1GOAEbvQYUJq+LHH17qNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,
On Thu, Sep 20, 2018 at 2:30 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Thu, 20 Sep 2018 08:24:55 -0500, Matt Weber wrote:
> > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> > ---
> >  package/glibc/Config.in | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/package/glibc/Config.in b/package/glibc/Config.in
> > index 57a2e83..63dd0f4 100644
> > --- a/package/glibc/Config.in
> > +++ b/package/glibc/Config.in
> > @@ -5,5 +5,6 @@ config BR2_PACKAGE_GLIBC
> >       default y
> >       select BR2_PACKAGE_LINUX_HEADERS
> >       select BR2_TOOLCHAIN_HAS_SSP
> > -
> > +     help
> > +       https://www.gnu.org/software/libc/
>
> This option is a blind option, so having a help text is not very
> useful...

I had been looking at verifying and updating all packages which could
end-up with content on target to have a valid URL.  This allows
auto-generation of CPE XML update requests which need product site
urls.

Matt
