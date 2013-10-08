From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Tue, 8 Oct 2013 17:17:29 +0200
Subject: [Buildroot] Buildroot patchwork: decision on the 10 oldest
	patches, week 1
In-Reply-To: <20131006164227.0ab2a172@skate>
References: <20131006164227.0ab2a172@skate>
Message-ID: <20131008151729.GB3599@ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Oct 06, 2013 at 04:42:27PM +0200, Thomas Petazzoni wrote:

[...]

> So, for this first week, the patches are:
> 
>  1 New: add lava-test package
>    http://patchwork.ozlabs.org/patch/155498/
>    ludovic.desroches at atmel.com
> 

I don't know if this package will be used by many people. The interesting
part is to know if the python path is now set correctly (I had something like
this
#!/home/user/MyProjects/versioned/buildroot/output/host/usr/bin/python
instead of #!/usr/bin/python). To be honest I have not tried with newer
versions of Buildroot. I'll do the try.

Regards

Ludovic
