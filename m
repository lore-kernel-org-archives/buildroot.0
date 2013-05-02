From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Thu, 2 May 2013 15:30:18 +0000
Subject: [Buildroot] [PATCH v3 00/11] ARC port
In-Reply-To: <20130502172412.6ce3463d@skate>
References: <1367499650-29869-1-git-send-email-mjonker@synopsys.com>
 <20130502172412.6ce3463d@skate>
Message-ID: <E6BF041E97966E4DB955F0DF883AD2D6339FE71E@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> > Changes in v3:
> >  * removed GCC arch-dependency cleanup patch (should be discussed 
> > separately)
> >  * 3.9-rc8-->3.9 kernel headers
> >  * Added bison/flex host dependencies

> Hum, what happened to the gcc changes to have the host-bison/host-flex dependencies, 
> and the changes to make sure that $(HOST_DIR)/usr/bin is in the PATH when building gcc?

Host-flex, host-bison dependencies for binutils squashed into patch v3 03/11, as you suggested. 

I moved the host-flex, host-bison dependencies before the rest of the patches (as suggested), but 
now I notice that I forgot to include it in the series (doh!). Should I send it separately, or would
you rather like a v4?

Thanks,

Mischa
