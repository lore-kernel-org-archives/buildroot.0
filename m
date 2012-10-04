From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Oct 2012 15:36:50 +0200
Subject: [Buildroot] [PATCH] New package liblog4c-localtime
In-Reply-To: <CAHXCMMKR3h3+wRdXgjCE_DzOJSv1SJhttqNvNt8_k_ac6LUJ0A@mail.gmail.com>
References: <1349341682-12387-1-git-send-email-fenixk19@mail.ru>
 <506D527D.2010502@mail.ru>
 <CAHXCMMKR3h3+wRdXgjCE_DzOJSv1SJhttqNvNt8_k_ac6LUJ0A@mail.gmail.com>
Message-ID: <20121004153650.186683bc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Thu, 4 Oct 2012 11:24:04 +0200, Samuel Martin wrote:

> >> + $(eval $(call AUTOTARGETS))

And also if you want us to apply this patch in the current Buildroot
version, this has to be changed to:

$(eval $(autotools-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
