From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Dec 2010 09:50:57 +0100
Subject: [Buildroot] [PATCH 12/13] screen: bump to version 4.0.3
In-Reply-To: <87zkrwsy45.fsf@macbook.be.48ers.dk>
References: <1292605474-19443-1-git-send-email-gustavo@zacarias.com.ar>
	<1292605474-19443-12-git-send-email-gustavo@zacarias.com.ar>
	<20101223083303.07f8a70f@surf> <87zkrwsy45.fsf@macbook.be.48ers.dk>
Message-ID: <20101223095057.6c7ff091@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 23 Dec 2010 09:16:10 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  >> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>  >> ---
>  >> .../screen/screen-4.0.2-cross_compile_fix.patch    |  524 --------------------
>  >> package/screen/screen-4.0.2_install-fix.patch      |   21 -
>  >> package/screen/screen-cross_compile_fix.patch      |  524 ++++++++++++++++++++
> 
>  Thomas> I am not terribly happy about this cross_compile_fix patch that
>  Thomas> directly hacks the ./configure script.
> 
> Me neither. Notice that it was just renamed here, not introduced.

Yes, yes, it really wasn't a criticism of Gustavo's work here, not
at all. Just wondering what this patch does.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
