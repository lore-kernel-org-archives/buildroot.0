From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 26 Apr 2020 12:24:20 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-04-25
In-Reply-To: <5ea529b6.1c69fb81.2cc08.1f4eSMTPIN_ADDED_MISSING@mx.google.com>
References: <5ea529b6.1c69fb81.2cc08.1f4eSMTPIN_ADDED_MISSING@mx.google.com>
Message-ID: <CAJiuCcdouYYbp1yvQcjpE5-E5S2xXsUf02Boccwz+PPos0BgEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Yann,

On Sun, 26 Apr 2020 at 08:27, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Recent build failures and runtime-tests failures
> ================================================
>
> This is the list of Buildroot build failures that occurred on
> 2020-04-25, and for which you are a registered architecture developer,
> package developer or defconfig developer. This list also include
> runtime tests failures. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
>
> Results for the 'master' branch
> -------------------------------
>
> Build failures related to your defconfigs:
>
>                         defconfig |                        link to the job
> ----------------------------------+--------------------------------------------------------------
>                       beelink_gs1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/526035566
>

The defconfig is missing HOST_PYTHON is this something that should
also trigger on computer where python-dev is installed?

Regards,
Clement

>
>
> --
> http://autobuild.buildroot.net
