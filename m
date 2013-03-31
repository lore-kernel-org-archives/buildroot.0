From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 31 Mar 2013 07:23:40 +0300
Subject: [Buildroot] elftosb package
In-Reply-To: <15AE5A936F5E3A42A9144E66875A0A89308AC8@server1-derijp.CLB-Benelux.lokaal>
References: <15AE5A936F5E3A42A9144E66875A0A89308AC8@server1-derijp.CLB-Benelux.lokaal>
Message-ID: <20130331042340.GA4076@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ruud,

On Fri, Mar 29, 2013 at 04:56:51PM +0100, Ruud Commandeur wrote:
> For the imx28 I need the elftosb tool to generate the u-boot.sb file. At
> the moment I use the version from an earlier installed ltib
> configuration, but I would like to install this as be part of the
> buildroot toolchain. This seems to be possile, since there is an elftosb
> package directory. However: it is not added to the package configuration
> to select it and it lacks a Config.in file. Can anyone tell me how I can
> add this package?

Select mxs-bootlets from the Bootloaders menu. The elftosb utility should 
build and run automatically.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
