From: Pierret David <david.pierret@smile.fr>
Date: Mon, 17 Sep 2018 12:24:00 +0200
Subject: [Buildroot] [PATCH 1/2] monkey: bump to version 1.6.9
In-Reply-To: <936e3a5a-ee9c-7f6a-be57-371fa12e6cce@smile.fr>
References: <936e3a5a-ee9c-7f6a-be57-371fa12e6cce@smile.fr>
Message-ID: <2073ebc2-4381-9329-9d96-efe4113852e8@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This patch contain an error.
I have resend it.

sorry for inconvenience.

David

Le 17/09/2018 ? 12:08, Pierret David a ?crit?:
> This commit update monkey-server package to 1.6.9
> 
> The --datadir option have been moved to --webroot.
> The --plugdir option does not exist anymore.
> 
> Signed-off-by: David Pierret <david.pierret@gmail.com>
> ---
>  ?package/monkey/monkey.hash | 6 +++---
>  ?package/monkey/monkey.mk?? | 7 +++----
>  ?2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/package/monkey/monkey.hash b/package/monkey/monkey.hash
> index 6c7eada..47e0e0d 100644
> --- a/package/monkey/monkey.hash
> +++ b/package/monkey/monkey.hash
> @@ -1,3 +1,3 @@
> -# md5 from 
> http://monkey-project.com/releases/1.5/monkey-1.5.6.tar.gz.md5, sha256 
> locally computed:
> -md5??? 9699e4c9ea6ce6b989907c252ae80254                 
> monkey-1.5.6.tar.gz
> -sha256 7c3d845306aa74ee6effd7ab6169d16ac4e6450e564954d0d0baa2d1e9be1a22 
> monkey-1.5.6.tar.gz
> +# md5 from 
> http://monkey-project.com/releases/1.6/monkey-1.6.9.tar.gz.md5, sha256 
> locally computed:
> +md5??? c401734985a936ee07dbff5eca7d176a                 
> monkey-1.6.9.tar.gz
> +sha256 f1122e89cda627123286542b0a18fcaa131cbe9d4f5dd897d9455157289148fb 
> monkey-1.6.9.tar.gz
> diff --git a/package/monkey/monkey.mk b/package/monkey/monkey.mk
> index 02c26c9..58bc26e 100644
> --- a/package/monkey/monkey.mk
> +++ b/package/monkey/monkey.mk
> @@ -4,8 +4,8 @@
>  ?#
> 
> ################################################################################ 
> 
> 
> -MONKEY_VERSION_MAJOR = 1.5
> -MONKEY_VERSION = $(MONKEY_VERSION_MAJOR).6
> +MONKEY_VERSION_MAJOR = 1.6
> +MONKEY_VERSION = $(MONKEY_VERSION_MAJOR).9
>  ?MONKEY_SITE = http://monkey-project.com/releases/$(MONKEY_VERSION_MAJOR)
>  ?MONKEY_LICENSE = Apache-2.0
>  ?MONKEY_LICENSE_FILES = LICENSE
> @@ -17,11 +17,10 @@ MONKEY_LICENSE_FILES = LICENSE
>  ?MONKEY_CONF_OPTS = \
>  ???? --prefix=/usr \
>  ???? --sysconfdir=/etc/monkey \
> -??? --datadir=/var/www \
> +??? --webroot=/var/www \
>  ???? --mandir=/usr/share/man \
>  ???? --logdir=/var/log \
>  ???? --pidfile=/var/run \
> -??? --plugdir=/usr/lib/monkey \
>  ???? --malloc-libc
> 
>  ?# --uclib-mode is not a typo

-- 
<div>
     <link href="https://fonts.googleapis.com/css?family=Raleway" 
rel="stylesheet" type="text/css">
     <font face="Raleway, regular">
     <table style="padding:20px;margin-bottom:-10px" border=0>
         <tbody>
         <tr>
             <td style="font-size:13px; color:#ff8054; text-align: 
center; padding-right:30px">
                 <a href="http://www.smile.eu/">
                     <img style="max-width:100%; height:auto" 
src="http://ftp.smile.fr/client/Communication/signature/img/Logo-new.png" 
alt="SMILE"/>
                 </a><br/><br/>
                     <p style="line-heigth:8px">2 Esplanade Compans 
Caffarelli, 31100 Toulouse</p>
             </td>
             <td style="border-left: 1px solid #3b7ffe; 
padding-left:20px; font-size:13px; color:#ff8054;">
                 <div style="color:#ff8054; font-size:14px;">
                     <b>David PIERRET</b>
                 </div>
                 <div style="color:#3b7ffe; font-size:13px;">
                     Ing?nieur Etude et D?veloppement<br>

                 </div><br>
                 <div style="color:#3b7ffe; font-size:13px;">
                     <span style="white-space: nowrap"><img 
style="margin-right:5px" 
src="http://ftp.smile.fr/client/Communication/signature/img/mail.png" 
alt="email" width="12" height="10" />
                         <a href="mailto:david.pierret@smile.fr" 
style="color:#3b7ffe; font-size:13px; 
text-decoration:none;">david.pierret at smile.fr</a>
                     </span>
                      <br>
                                     <span style="white-space: 
nowrap"><img style="margin-right:5px" 
src="http://ftp.smile.fr/client/Communication/signature/img/phone.png" 
alt="phone" width="10" height="10" /></span>
 
+33662312341
                                     <br>
                                                     <span 
style="white-space: nowrap"><img style="margin-right:5px" 
src="http://ftp.smile.fr/client/Communication/signature/img/web.png" 
alt="url" width="12" height="12" />
<a href="http://www.smile.eu/" style="color:#3b7ffe; font-size:13px; 
text-decoration:none;">http://www.smile.eu/</a>
                   </span>
                                 </div>

                 <br>
                 <div>
                     <span><a style="margin-right:5px" 
href="https://twitter.com/openwide_inge"><img 
src="http://ftp.smile.fr/client/Communication/signature/img/rs-twitter.png" 
alt="Twitter" style="max-width:100%; height:auto"/></a></span>
                     <span><a style="margin-right:5px" 
href="https://www.facebook.com/smileopensource"><img 
src="http://ftp.smile.fr/client/Communication/signature/img/rs-facebook.png" 
alt="Facebook" style="max-width:100%; height:auto"></a></span>
                     <span><a style="margin-right:5px" 
href="https://fr.linkedin.com/in/david-pierret-11912290"><img 
src="http://ftp.smile.fr/client/Communication/signature/img/rs-linkedin.png" 
alt="LinkedIn" style="max-width:100%; height:auto"/></a></span>
                     <span><a style="margin-right:5px" 
href="https://github.com/Smile-SA"><img 
src="http://ftp.smile.fr/client/Communication/signature/img/rs-github.png" 
alt="Github" style="max-width:100%; height:auto"/></a></span>
                 </div>
             </td>
         </tr>
         </tbody>
     </table>
     <br>
     <div> <a 
href="https://www.smile.eu/fr/publications/livres-blancs/freertos-aws?utm_source=signature&amp;utm_medium=email&amp;utm_campaign=signature"><img 
src="https://signature.smile.eu/assets/img/bandeaux_signature_mail_FreeRTOS.gif.gif" 
alt="D?couvrez l?univers Smile, rendez-vous sur smile.eu" border="0" 
/></a></div>
     <br>
     <div style="color:#a3acb5; font-size:10px;">
         <img 
src="http://ftp.smile.fr/client/Communication/signature/img/eco.png" 
alt="eco" width="13" height="11" />
             Pour la plan?te, n'imprimez ce mail que si c'est n?cessaire
     </div>
     </font>
</div>
