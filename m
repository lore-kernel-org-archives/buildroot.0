From: Philippe REYNES <philippe.reynes@sagemcom.com>
Date: Tue, 6 Nov 2012 07:38:54 +0100
Subject: [Buildroot] [PATCH] [v3] Allow to run severals post build
 scripts instead of only one
In-Reply-To: <509059C3.4080109@mind.be>
References: <3558_1351493584_508E27D0_3558_1558_1_1351493605-22269-1-git-send-email-philippe.reynes@sagemcom.com>
 <509059C3.4080109@mind.be>
Message-ID: <21241_1352183937_5098B081_21241_18787_1_OF7B519B75.588186A9-ONC1257AAE.002464C5-C1257AAE.0024853E@sagemcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've tried to remove this backslashes, and I've got an error when building:


/bin/sh: -c: line 0: syntax error near unexpected token `('
/bin/sh: -c: line 0: `echo ">>>   "Executing post-build script(s)""'
make: *** [target-finalize] Error 1

So those backslashes are usefull.

Regards,
Philippe




                                                                           
             Arnout                                                        
             Vandecappelle                                                 
             <arnout@mind.be>                                            A 
                                       Philippe Reynes                     
             10/30/2012 23:50          <philippe.reynes@sagemcom.com>      
                                                                        cc 
                                       buildroot at busybox.net               
                                                                     Objet 
                                       Re: [Buildroot] [PATCH] [v3] Allow  
                                       to run severals post build scripts  
                                       instead of only one                 
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           




On 10/29/12 07:53, Philippe Reynes wrote:
> +          @$(call MESSAGE,"Executing post-build script\(s\)")

  Aren't these backslashes redundant?

  Regards,
  Arnout
--
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR
Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F



#
" Ce courriel et les documents qui lui sont joints peuvent contenir des
informations confidentielles ou ayant un caract?re priv?. S'ils ne vous sont
pas destin?s, nous vous signalons qu'il est strictement interdit de les
divulguer, de les reproduire ou d'en utiliser de quelque mani?re que ce
soit le contenu. Si ce message vous a ?t? transmis par erreur, merci d'en
informer l'exp?diteur et de supprimer imm?diatement de votre syst?me
informatique ce courriel ainsi que tous les documents qui y sont attach?s."


                               ******

" This e-mail and any attached documents may contain confidential or
proprietary information. If you are not the intended recipient, you are
notified that any dissemination, copying of this e-mail and any attachments
thereto or use of their contents by any means whatsoever is strictly
prohibited. If you have received this e-mail in error, please advise the
sender immediately and delete this e-mail and all attached documents
from your computer system."
#
