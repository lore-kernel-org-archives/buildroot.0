From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Fri, 29 Nov 2013 10:26:33 +0200
Subject: [Buildroot] [PATCH 2/2] qt5base: use ccache if enabled
In-Reply-To: <871u1zy68l.fsf@dell.be.48ers.dk>
References: <1384436438-2119-1-git-send-email-fatih.asici@gmail.com>
 <201311290910.54807.fatih.asici@gmail.com> <871u1zy68l.fsf@dell.be.48ers.dk>
Message-ID: <201311291026.33248.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 29 November 2013 10:14:34 Peter Korsgaard wrote:
> >>>>> "Fatih" == Fatih A??c? <fatih.asici@gmail.com> writes:
> Hi,
> 
>  >> > + -device-option BUILDROOT_CCACHE="$(CCACHE)" \
>  >> 
>  >> Can't we just pass it in CROSS_COMPILE?
> >> 
> >> No. linux_device_pre.conf uses CROSS_COMPILE for other tools, too (ar,
> >> objcopy,
> 
> Yes, but ccache then just becomes a NOOP - E.G:

I did not know this. Will send a new patch if it works.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131129/cc2a009c/attachment.html>
