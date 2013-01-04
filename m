From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 04 Jan 2013 17:52:57 -0300
Subject: [Buildroot] [PATCH] libnl: bump to version 3.2.17
In-Reply-To: <87hamwn0br.fsf@dell.be.48ers.dk>
References: <1357332135-3087-1-git-send-email-gustavo@zacarias.com.ar>
 <87hamwn0br.fsf@dell.be.48ers.dk>
Message-ID: <50E74129.5050105@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/04/2013 05:46 PM, Peter Korsgaard wrote:
>  Gustavo> -LIBNL_VERSION = 3.2.16
>  Gustavo> +LIBNL_VERSION = 3.2.17
> 
> Committed, thanks.
> 
> Could you have a look at http://patchwork.ozlabs.org/patch/208318/ ?

Yes, it's no longer required, part of 3.2.17
Seems many people had issues with old enough headers and upstream
decided to release .17 with those patches to fit it.
Also fixes our previous autobuild errors which i assume went away when
Thomas probably upgraded to new toolchain versions.
We are talking about <2.6.32 headers IIRC.
Regards.
