From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Jan 2017 09:32:47 +0100
Subject: [Buildroot] [PATCH] use nproc
In-Reply-To: <87zijd87rg.fsf@dell.be.48ers.dk>
References: <6f25e6c1-c176-629f-321c-9b404c5d6de6@landley.net>
 <87zijd87rg.fsf@dell.be.48ers.dk>
Message-ID: <20170101093247.1e9cc6b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Dec 2016 21:46:43 +0100, Peter Korsgaard wrote:

>  > My rule of thumb is that once a change is 7 years old, you can rely on
>  > the installed base to have it. With that in mind, would you like to use
>  > nproc to check how many processors are available?  
> 
>  > http://git.savannah.gnu.org/gitweb/?p=coreutils.git;a=commit;h=74cf4cb26dcecd36eb45dc00dbd4587d9dc24a2f  
> 
> Why? What is the advantage? Purely cosmetical? Are there any well known
> distributions providing nproc and not getconf?

Well, the simplification provided by Rob looks useful to me. It's
purely cosmetic, but we also do tons of other cosmetic changes.

The big question is whether nconf is available even in the really old
RHEL distros that some of our users have.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
