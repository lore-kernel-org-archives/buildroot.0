From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 11 Jan 2015 16:42:16 -0300
Subject: [Buildroot] [PATCH] libpng: add  libpng12
In-Reply-To: <54B2C5B5.4070703@ou.edu>
References: <54B2C5B5.4070703@ou.edu>
Message-ID: <54B2D218.2030304@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/11/2015 03:49 PM, Steve Kenton wrote:

> Some programs still link using the legacy -lpng12 version
> of libpng for handling PNG (Portable Network Graphics)
> images. It is still maintained for security fixes so
> make it available.
> 
> http://www.libpng.org
> 
> Signed-off-by Stephen M. Kenton <skenton@ou.edu>
> ---
> The png support in freetype uses libpng v1.2 instead of v1.6.
> Currently freetype is configured without png support but another
> package I am investigating wants it, so here is a patch to enable it.
> I copied and modified the files from libpng and do not know if the
> arm specific option is needed for v1.2 since I'm only using x86.

Hi.
Which programs?
Freetype works and links against libpng(16) just fine.
So i don't see any reason for libpng12 right now.
Regards.
