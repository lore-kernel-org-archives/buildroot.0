From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Mon, 17 Feb 2020 08:42:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-simplejson: bump to
 version 3.17.0
In-Reply-To: <874kvqhank.fsf@dell.be.48ers.dk>
References: <20200213055608.76191-1-james.hilliard1@gmail.com>
 <874kvqhank.fsf@dell.be.48ers.dk>
Message-ID: <20200217074230.bzyxboycybkiy4ua@M43218.corp.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 16, 2020 at 03:25:19PM +0100, Peter Korsgaard wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> >>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
> 
>  > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> 
> Committed, thanks.
> 
> What is the use case for this library in Buildroot? Isn't it just
> identical to the json module included with python / python3?

Hi,

Long time ago it was a requirement for Lava, that's why I introduced it.
Since we are no longer using it and I know many changes happened to this
project, I don't know if it's still needed.

Regards

Ludovic

> 
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
