From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Dec 2010 20:34:37 +0100
Subject: [Buildroot] problem with new package partimage
In-Reply-To: <AANLkTinScnan+v3ys81p40EohreZpLYY3CrWkzxPWHy8@mail.gmail.com>
References: <AANLkTimc0c=FW=2Zv4jT9WWV7bc903J2VkOoZ0L9a+Af@mail.gmail.com>
	<AANLkTinScnan+v3ys81p40EohreZpLYY3CrWkzxPWHy8@mail.gmail.com>
Message-ID: <20101209203437.766b210e@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 9 Dec 2010 16:40:21 +0100
Jomas Nash <jomasnash@gmail.com> wrote:

> I found another strange thing with partimage.
> When I start partimage and run 'ps'  in an other terminal, I see that
> 3 instances of partimage are running.
> like:
> 
> 1117   partimage -S  etc...
> 1118   partimage -S
> 1119   partimage -S
> 
> All three lines have the same parameters
> At my "normal" linux system (ubuntu) there is only one instance of
> partimage when I start it
> 
> 
> Has anybody an idea what can cause this?

Busybox ps probably show all the threads by default, while the normal
ps shows only processes and hides all their threads.

> It looks like partimge does not want to be compiled in buildroot.

This sentence simply doesn't make sense. It's not because there is a
bug somewhere that "partimage does not want to be compiled in
Buildroot".

Regards!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
