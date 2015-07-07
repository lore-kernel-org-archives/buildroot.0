From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 7 Jul 2015 17:27:31 +0300
Subject: [Buildroot] [PATCH 4/4] popt: add hash file
In-Reply-To: <559BDFF4.4010003@zacarias.com.ar>
References: <1436273552-2877-1-git-send-email-gustavo@zacarias.com.ar>
 <1436273552-2877-4-git-send-email-gustavo@zacarias.com.ar>
 <20150707141712.GA12326@tarshish>
 <559BDFF4.4010003@zacarias.com.ar>
Message-ID: <20150707142731.GB12326@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 07, 2015 at 11:19:32AM -0300, Gustavo Zacarias wrote:
> On 07/07/15 11:17, Baruch Siach wrote:
> 
> >>+# Locally calculated based on http://anduin.linuxfromscratch.org/sources/BLFS/svn/p/popt-1.16.tar.gz.md5sum
> >
> >What does that mean?
> >
> >>+sha256	e728ed296fe9f069a0e005003c3d6b2dde3d9cad453422a10d6558616d304cc8	popt-1.16.tar.gz
> 
> That i've verified that the md5 is right and then calculated the sha256.

Is there a reason not to have both md5 (from LFS) and sha256 (locally 
calculated)?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
