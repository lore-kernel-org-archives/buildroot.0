From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Dec 2014 19:21:34 +0100
Subject: [Buildroot] [PATCH] package/faad2: add hash
In-Reply-To: <87tx0ynlx1.fsf@dell.be.48ers.dk>
References: <1418578396-11893-1-git-send-email-yann.morin.1998@free.fr>
 <XnsA403BE33C127EberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <87tx0ynlx1.fsf@dell.be.48ers.dk>
Message-ID: <20141214182134.GD4121@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-12-14 19:09 +0100, Peter Korsgaard spake thusly:
> >>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:
> 
>  > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
>  > news:1418578396-11893-1-git-send-email-yann.morin.1998 at free.fr:
> 
>  >> +++ b/package/faad2/faad2.hash
>  >> @@ -0,0 +1,2 @@
>  >> +# Locally computed
>  >> +sha256  ee26ed1e177c0cd8fa8458a481b14a0b24ca0b51468c8b4c8b676fd3ceccd330  
>  > faad2-2.7.tar.gz
> 
>  > Hi,
> 
>  > just a small note because the buildroot doc says hash values provided by 
>  > upstream are prefered:
> 
>  > Looking at http://sourceforge.net/projects/faac/files/faad2-src/faad2-2.7/ 
>  > you can click on the "i" button of faad2-2.7.tar.bz2 to display its md5/sha1 
>  > values, they could be added to our hash file instead of a locally computed 
>  > hash.
> 
> Indeed, similar to how I did it for liblo in b08c503b244d37. Yann, will
> you respin the patch?

Yes, almost done. ;-)

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
