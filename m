From: Pieter Smith <pieter@boesman.nl>
Date: Wed, 6 Apr 2016 22:26:01 +0200
Subject: [Buildroot] [PATCH v4 4/7] barebox: introduce barebox-package
	function
In-Reply-To: <5702F778.7030307@mind.be>
References: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
 <1458513351-6556-5-git-send-email-pieter@boesman.nl>
 <5702F778.7030307@mind.be>
Message-ID: <20160406202601.GB5332@smipidev>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 05, 2016 at 01:23:36AM +0200, Arnout Vandecappelle wrote:
>  Oh, one thing I forgot...
> 
> On 03/20/16 23:35, Pieter Smith wrote:
> >+# instantiate this barebox package
> >+$(eval $(call barebox-package))
> 
>  The $(call ...) is not needed here. call is only needed if there are arguments.

ACK. Already fixed for v5.

>  Regards,
>  Arnout
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

- Pieter
