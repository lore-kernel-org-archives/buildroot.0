From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 27 Jul 2016 17:14:00 +0100
Subject: [Buildroot] [BUILDROOT] package to check hdmi screen
In-Reply-To: <CALtfCQbD7Y6TDjDTWrGTJQ6OF4+DeGZUPhwXs5d_9vsVqareMA@mail.gmail.com>
References: <CALtfCQbD7Y6TDjDTWrGTJQ6OF4+DeGZUPhwXs5d_9vsVqareMA@mail.gmail.com>
Message-ID: <9ebc1b33-4290-44eb-4401-0a707451d417@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hola ?scar :-)

indeed, we don't have the fbi package. fbi is a framebuffer image
viewer, so maybe you can do the same with the fbv package which is
included in Buildroot:

##################################################
BR2_PACKAGE_FBV:
fbv is a very simple graphic file viewer for the framebuffer console,
capable of displaying GIF, JPEG, PNG and BMP files using libungif,
libjpeg and libpng.

http://freshmeat.net/projects/fbv/

Symbol: BR2_PACKAGE_FBV [=n]
Type  : boolean
Prompt: fbv
Location:
-> Target packages
-> Graphic libraries and applications (graphic/text)
Defined at package/fbv/Config.in:1
##################################################

Regards,

Vincent.

On 27/07/16 16:56, Oscar Gomez Fuente wrote:
> Hi everyone,
> 
> I would like to check my hdmi screen. I'm thinking in show an image on
> my hdmi screen.
> 
> Making a searching on internet I found this command to show an image in
> the hdmi screen:
> 
> # fbi -T 2 -d /dev/fb1 -noverbose -a name_image.png
> 
> But I can't see the package fbi in buildroot.
> 
> Does anyone know any other similar package for this purpose?
> 
> Best regards.
> 
> 
> photo	?scar G?mez Fuente
> Electronic Engineer & Degree in Physical Sciences
> Mobile: 659.28.97.90 <tel:659.28.97.90>
> Email: oscargomezf at gmail.com <mailto:oscargomezf@gmail.com>
> Website: www.oscargomezf.com <http://www.oscargomezf.com/>
> <http://facebook.com/oscargomezf> <http://plus.google.com/oscargomezf> <http://us.linkedin.com/in/oscargomezf> <http://twitter.com/oscargomezf_com>
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
