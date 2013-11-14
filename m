From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Thu, 14 Nov 2013 17:05:15 -0300
Subject: [Buildroot] qt5base: Regression with 2013.11_rc1 or HEAD
In-Reply-To: <87d2m22a9l.fsf@dell.be.48ers.dk>
References: <CAAEAJfA07aJ29cyQfXGb-rCjD7HfBPbwbpodb9iHSk+U5MG+aQ@mail.gmail.com>
 <87d2m22a9l.fsf@dell.be.48ers.dk>
Message-ID: <20131114200514.GE9912@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 14, 2013 at 05:55:34PM +0100, Peter Korsgaard wrote:
> >>>>> "Ezequiel" == Ezequiel Garc?a <ezequiel@vanguardiasur.com.ar> writes:
> 
>  > Hi Peter, Fatih,
>  > One of the Qt5 patches no longer applies. Mind taking a look?
> 
> Yeah, that unfortunately got broken by one of the last patches before
> -rc1. It is fixed in git by be930801a26193024.
> 
> I will put out -rc2 this weekend.
> 

Sure, no problem. I can confirmed it's fixed in current HEAD.
(it seems I missed to test the latter properly).

Thanks and sorry for the noise,
-- 
Ezequiel Garc?a, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
