From: Emil =?ISO-8859-1?Q?Kr=FCper?= <e.krueper@solcon-systemtechnik.de>
Date: Fri, 18 Apr 2008 08:32:50 +0200
Subject: [Buildroot] Anyone know how I can make my Buildroot
	filesystem	R/W?
In-Reply-To: <326f33790804172320l4f23b3d7qa3d232ec7e222ef6@mail.gmail.com>
References: <326f33790804171739s79ba1be1s929513770702d548@mail.gmail.com>
	<4808344B.5050201@speakeasy.net>
	<326f33790804172320l4f23b3d7qa3d232ec7e222ef6@mail.gmail.com>
Message-ID: <1208500370.10123.7.camel@PC-EK.Solcon>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arun,

?Have a look in the manpage for mount. Just a trivial 'man mount' in the
command line. Then you will stumble across the syntax and options etc.
and you finally realize you have to type 'mount -o remount,rw /' in the
shell of your bootable filesystem. Thus your FS will be remounted with
the rw options.

Best regards

Emil Kr?per

On Thu, 2008-04-17 at 23:20 -0700, Arun Reddy wrote:
> Sean,
> 
> I did find this option as well looking online, but where must I enter
> it? I know this must be a trivial question but I can't figure out how
> to make use of it.
> 
> Thanks!
> 
> On Thu, Apr 17, 2008 at 10:40 PM, Sean Perry <shaleh@speakeasy.net>
> wrote:
>         Arun Reddy wrote:
>                 I am so happy that I have my new bootable filesystem
>                 created by buildroot! But I noticed when I boot it up
>                 I can't write or change anything. Does anyone know how
>                 I can make my new system R/W instead of just R?
>                 
>         
>         
>         you need something more than 'mount -o remount,rw /'?
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
