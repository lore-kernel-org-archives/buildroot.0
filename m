From: Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@laposte.net>
Date: Sun, 29 Oct 2017 19:11:42 +0100
Subject: [Buildroot] [PATCH] uftrace: new package
In-Reply-To: <20171029125148.GA2290@itchy>
References: <20170625193743.8424-1-vincent.stehle@laposte.net>
 <20171029125148.GA2290@itchy>
Message-ID: <20171029181141.a5odmpknbmfzyr2n@romuald.bergerie>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 29, 2017 at 01:51:48PM +0100, Eric Le Bihan wrote:
> Any update on this patch series?

 Bonjour Eric,

I am sorry, it has been a while since I worked on those patches :(

(-pg or -finstrument-functions)
> How can those flags be passed when compiling Buildroot packages?

I am not sure if we have a clean way through a configuration variable.

The way I did it was a bit of a hack as I edited the concerned package makefile
directly (and I find it one strength of buildroot that you can do that type of
modification so easily when needed.)

Maybe we need a way to add arbitrary options to the CFLAGS, per package?

Best regards,

Vincent.
