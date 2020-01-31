From: Carlos Santos <unixmania@gmail.com>
Date: Fri, 31 Jan 2020 08:30:23 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-01-30
In-Reply-To: <5e33d4ae.1c69fb81.ad6da.2160SMTPIN_ADDED_MISSING@mx.google.com>
References: <5e33d4ae.1c69fb81.ad6da.2160SMTPIN_ADDED_MISSING@mx.google.com>
Message-ID: <CAJ4jsaei097TWPPVeW4OrjJD70it6oXdy4r4e8iEO9NWUrw96w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 31, 2020 at 4:18 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Recent build failures and runtime-tests failures
> ================================================
>
> This is the list of Buildroot build failures that occurred on
> 2020-01-30, and for which you are a registered architecture developer,
> package developer or defconfig developer. This list also include
> runtime tests failures. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
>
> Results for the 'master' branch
> -------------------------------
>
> Build failures related to your packages:
>
>     arch     |             reason             |                                       url
> -------------+--------------------------------+---------------------------------------------------------------------------------
>   mips64el   |      libpam-tacplus-1.5.1      | http://autobuild.buildroot.net/results/2330b996f692dd06b77c4bce720cc608eca464bb
>     arc      |      libpam-tacplus-1.5.1      | http://autobuild.buildroot.net/results/35aa5bcbc1e65e9c20bc8a4c897698c15f6480b9

Could somebody please apply the fix sent by Fabrice Fontaine?

    https://patchwork.ozlabs.org/patch/1227407/

There is also this small improvement:

    https://patchwork.ozlabs.org/patch/1227429/

-- 
Carlos Santos <unixmania@gmail.com>
