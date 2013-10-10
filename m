From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Oct 2013 14:02:13 +0200
Subject: [Buildroot] [PATCH 5/9] package/weston: fix configure.ac for
	fbdev compositor
In-Reply-To: <87iox5weis.fsf@dell.be.48ers.dk>
References: <cover.1381354867.git.yann.morin.1998@free.fr>
 <ed39c3ca66c380b924f2e2dca9daf8255a480304.1381354867.git.yann.morin.1998@free.fr>
 <87iox5weis.fsf@dell.be.48ers.dk>
Message-ID: <201310101402.13934.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Thursday 10 October 2013 13:28:59 Peter Korsgaard wrote:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  Yann> Apply patch from upstream.
> 
> Are there any other pending fbdev patches upstream? A quick test seems
> to show that the fbdev backend isn't working:
> 
>  CC       weston_subsurfaces-subsurfaces.o
>   CC       weston_simple_shm-simple-shm.o
>   CC       weston_simple_shm-os-compatibility.o
> subsurfaces.c:37:23: fatal error: GLES2/gl2.h: No such file or directory
> compilation terminated.
> make[4]: *** [weston_subsurfaces-subsurfaces.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
> make[4]: Leaving directory `/home/peko/source/buildroot/output/build/weston-1.2.2/clients'

Strange, I think it did build fine here last I checked.
I'll double-check this, but no, there's no upstream patch I mistakenly
forgot to git-add.

Test will be tonight when I'm back home.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
