From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 13 Jul 2020 01:34:48 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-07-11
Message-ID: <0a85e59a-fdd6-2505-512d-a37c527b78e2@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

On 7/12/20 11:09 PM, Thomas Petazzoni wrote:
> Hello,
> 
> Recent build failures and runtime-tests failures
> ================================================
> 
> This is the list of Buildroot build failures that occurred on
> 2020-07-11, and for which you are a registered architecture developer,
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
>      arch     |             reason             |                                       url
> -------------+--------------------------------+---------------------------------------------------------------------------------
>      arm      |         libnss-3.53.1          | http://autobuild.buildroot.net/results/8fa6e0c72d177185f98dfc7ff512eecd81aca05d
> 
> 
> 
> Results for the '2020.05.x' branch
> ----------------------------------
> 
> Build failures related to your packages:
> 
>      arch     |             reason             |                                       url
> -------------+--------------------------------+---------------------------------------------------------------------------------
>   powerpc64   |          libnss-3.52           | http://autobuild.buildroot.net/results/3cc5011b0c1587b4a9e0908db930467ffabd1241

This ^^^ is fixed by:
https://git.buildroot.net/buildroot/commit/?id=f30fc8944763c17ac8140c01b0775f458c6ade54

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
