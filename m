From: Theo Debrouwere <theo.debrouwere@skynet.be>
Date: Tue, 6 Sep 2016 14:07:39 +0200
Subject: [Buildroot] [PATCH]     add new library: libpugixml
In-Reply-To: <20160905233027.404898ba@free-electrons.com>
References: <20160904210846.1332-1-theo.debrouwere@skynet.be>
 <20160905233027.404898ba@free-electrons.com>
Message-ID: <20160906120739.hf6sacfuyopg5sud@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thanks for the pointers.
I'm cleaning up the patches & I'll resubmit them.

One question though:

> The readme.txt is good enough as a license file.
> 
> > +LIBPUGIXML_INSTALL_STAGING = YES
> > +
> > +LIBPUGIXML_SUBDIR = scripts
> 
> Hum, why?

Is this about the SUBDIR option?

The CMakeLists.txt file is in a subfolder called scripts,
so, it seems that I need this? Is there another option/setting?

Or should I add a comment about it?

I'm not sure what you are asking?

Theo
