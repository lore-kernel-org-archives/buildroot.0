From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 2 Jun 2018 17:44:59 +0200
Subject: [Buildroot] [PATCH 1/1] librtas: bump to version 2.0.1
In-Reply-To: <CAPi7W815UOMcksm06w0H9x4zm9syEPXJsOheEo9tsog0pQpRgA@mail.gmail.com>
References: <20180602144315.32208-1-fontaine.fabrice@gmail.com>
 <590fcbde-207a-9ae0-d27a-65332e36fbfc@gmail.com>
 <CAPi7W815UOMcksm06w0H9x4zm9syEPXJsOheEo9tsog0pQpRgA@mail.gmail.com>
Message-ID: <3ceb070b-e676-0ec8-07a5-b1718580c35b@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

Le 02/06/2018 ? 17:25, Fabrice Fontaine a ?crit?:
> Dear Romain,
> 
> 2018-06-02 16:56 GMT+02:00 Romain Naour <romain.naour@gmail.com
> <mailto:romain.naour@gmail.com>>:
> 
>     Hi Fabrice,
> 
>     Le 02/06/2018 ? 16:43, Fabrice Fontaine a ?crit?:
>     > - Switch site to github
>     > - Move to autotools infrastructure
>     > - Remove patch (not needed anymore)
>     > - Since version 1.4 (January 2016), license is now LGPL-2.1+
>     > - Add hash for license file
>     > 
>     > Signed-off-by: Fabrice Fontaine <fontaine.fabrice at gmail.com <mailto:fontaine.fabrice@gmail.com>>
> 
>     Did you check if powerpc-utils with rtas still build with this new version ?
> 
> Yes, powerpc-utils still builds with this new version.

Ok, thanks for checking :)

> By the way, this new version of librtas is quite old (July 2016) and
> powerpc-utils is up to date in buildroot (September 2017).

Indeed, there is no activity except one commit in July 2017 in next branch.

Best regards,
Romain

> 
>     IIRC, librtas package has been added by Sam Bobroff to be used with
>     powerpc-utils.
> 
>     Best regards,
>     Romain
> 
> Best Regards,
> 
> Fabrice
