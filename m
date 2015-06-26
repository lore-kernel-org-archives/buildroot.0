From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Jun 2015 17:22:46 +0200
Subject: [Buildroot] [PATCH v6 02/16] package/opencv: bump to version 3.0
In-Reply-To: <20150626145114.GA17113@free.fr>
References: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
 <1435262397-888-3-git-send-email-s.martin49@gmail.com>
 <20150626145114.GA17113@free.fr>
Message-ID: <20150626152245.GD17113@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-06-26 16:51 +0200, Yann E. MORIN spake thusly:
> On 2015-06-25 21:59 +0200, Samuel Martin spake thusly:
> > This major version bump is in fact a bump from 2.4.10 to 2.4.11, then to
> > 3.0.
[--SNIP--]
> > @@ -49,17 +47,17 @@ config BR2_PACKAGE_OPENCV_LIB_HIGHGUI
> >  	help
> >  	  Include opencv_highgui module into the OpenCV build.
> >  
> > -config BR2_PACKAGE_OPENCV_LIB_IMGPROC
> > -	bool "imgproc"
> > +config BR2_PACKAGE_OPENCV_LIB_IMGCODECS
> > +	bool "imgcodecs (image codecs)"
> 
> I forgot to say so in my previous review, but we ususally do not add
> such explications in the prompt, but in the help text.

OK, there is a patch later on that deals with prompt and help texts.
Let's see that...

However, I find it dubious that you add those texts in this patch, to
later remove them in a following patch. Why not just omit them to begin
with?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
