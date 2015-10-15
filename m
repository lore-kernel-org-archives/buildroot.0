From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 15 Oct 2015 21:44:03 +0200
Subject: [Buildroot] [PATCH v1] gst1-plugins-bad: update configure
 options
In-Reply-To: <561DFECB.2020009@mind.be>
References: <1444774091-19539-1-git-send-email-ps.report@gmx.net>
 <561DFECB.2020009@mind.be>
Message-ID: <20151015214403.1da7f271@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Wed, 14 Oct 2015 09:05:47 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 14-10-15 00:08, Peter Seiderer wrote:
> > - add new onvif option
> > - add new dtls option
> > - add new openh264 option
> > - add new x265 option
> > - rename real option to rtp
> > - remove legacy options: directdraw, osx_video, quicktime
> >   and mythtv
> > - add '--disable-bs2b' and '--disable-libde265' to options
> >   which require currently unpackaged libraries
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > ToDo: handle new '--disable-gtk3' and '--disable-qt' options
> 
>  If you don't handle them now (or plan to do so in the very near future), then
> explicitly disable them for the time being. This helps for reproducible builds.
> 

O.k. will do this (until I find enough time for a proper follow up patch)...

Regards,
Peter

>  Regards,
>  Arnout
> 
> 
