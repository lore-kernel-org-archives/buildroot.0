From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Sep 2013 09:39:36 +0200
Subject: [Buildroot] [PATCH 1/5] qt5: bump to 5.1.1
In-Reply-To: <201309212138.02246.fatih.asici@gmail.com>
References: <201309182118.23091.fatih.asici@gmail.com>
 <523B3759.1000901@mind.be> <20130919205514.53b092ff@skate>
 <201309212138.02246.fatih.asici@gmail.com>
Message-ID: <20130922093936.7e1869f9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fatih A??c?,

On Sat, 21 Sep 2013 21:38:02 +0300, Fatih A??c? wrote:

> I think, this part could be simplified by using a mkspec file for "Generic 
> Linux" device which could be accepted by upstream. In order to customize 
> variables we can use -device-option argument. As you mention in a comment in 
> qt5base.mk, this option has some problems. I sent[1] a patch to upstream which 
> fixes a problem when the value contains an equal sign.
> 
> I am also waiting[2] for a reply from upstream about the linux-generic-g++ 
> device suggestion.
> 
> I have tried this method on my local machine and it seems working.
> 
> [1] https://bugreports.qt-project.org/browse/QTBUG-33584
> [2] https://bugreports.qt-project.org/browse/QTBUG-33586

Great, this definitely looks like a nice solution! I'm happy to see
that you have taken the time to dive into Qt5 to polish all these
little problems, this is really cool. Looking forward to seeing more
progress on these things.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
