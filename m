From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 9 Apr 2015 07:43:39 +0300
Subject: [Buildroot] [PATCH 1/1 v2] libvpx: bump version to 1.4.0
In-Reply-To: <5525AF73.2080101@proximus.be>
References: <1428447211-24428-1-git-send-email-sagaert.johan@proximus.be>
 <20150408225139.3c65fe12@free-electrons.com>
 <5525AF73.2080101@proximus.be>
Message-ID: <20150409044339.GH2241@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Johan,

On Thu, Apr 09, 2015 at 12:45:07AM +0200, Johan Sagaert wrote:
> Thomas Petazzoni schreef op 8/04/2015 om 22:51:
> >On Wed,  8 Apr 2015 00:53:31 +0200, Sagaert Johan wrote:
> >>Use tar.bz2 instead of git.
> >>Also added the hash file.
> >>Changes: https://chromium.googlesource.com/webm/libvpx/+/0080aca235e2d677e49ff46c3e8e77d9dd15858c/CHANGELOG
> >>
> >>Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
> >Thanks, applied, after removing the unnecessary LIBVPX_VERSION_MAJOR
> >variable, as suggested by Arnout.
>
> Fine, thanks :
> Is there a thumb rule  when this is needed  ?  I see many packages use this
> scheme .

We split the _MAJOR part of the version when it is used on its one, e.g. for 
_SITE name.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
