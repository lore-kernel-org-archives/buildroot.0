From: Thomas Lundquist <lists@zelow.no>
Date: Sun, 18 Jan 2009 09:59:14 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package: libgtk2
	multimedia/gst-plugins-base mul etc...
In-Reply-To: <877i4t2i74.fsf@macbook.be.48ers.dk>
References: <20090118000558.DC88077108@busybox.osuosl.org>
	<877i4t2i74.fsf@macbook.be.48ers.dk>
Message-ID: <20090118085914.GA9100@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 18, 2009 at 08:21:03AM +0100, Peter Korsgaard wrote:
>  thomasez> -		--without-html-dir \
>  thomasez>  		$(DISABLE_LARGEFILE) \
> 
> You could have gotten rid of that line as well.
>  
>  thomasez>  GST_PLUGINS_UGLY_CONF_OPT = \
>  thomasez>  		$(DISABLE_NLS) \
> 
> And this one.

Yup, that's the next step. 

I was pondering about how to find all autotools--mk files and remove just from them. 

I guess "manually" ends up being the simplest way.


Thomas.
