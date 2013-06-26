From: Sinan Akpolat <sinan@linkas.com.tr>
Date: Wed, 26 Jun 2013 12:04:46 +0300
Subject: [Buildroot] About ti-gfx package
In-Reply-To: <51CAAD08.5010104@linkas.com.tr>
References: <51CAAD08.5010104@linkas.com.tr>
Message-ID: <51CAAEAE.5000505@linkas.com.tr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

My company is working on a AM3517 board. We are using Technexion's 
TAM3517 board for development right now.

I was working on TI's SDK a few weeks ago but some more urgent things 
came up. I would definitely like to help if we can get it working in 
Buildroot. I can also help in testing.

I don't know much about the history about TI's GFX SDK. I don't know 
about the soft float issue either. I was trying to run it with mfpu=neon 
parameter in the toolchain.

There are some other things I'm not certain.

I was working with 4_09_00_01 version and I think it works on AM35xx right?

Also I thought TI only supported kernels up to 2.6.37 for AM3517. I 
can't remember where I get that idea, but I know Technexion doesn't 
provide any later kernels for their AM3517 boards.

I don't know how buildroot works exactly but I started reading the 
documentation. I hope I can help. We are hoping to use EGL and Qt5, it 
will be easier to configure them and put the necessary files into the 
rootfs if Buildroot handles everything.

Sorry if I wrote technically incorrect stuff, I begin working on
