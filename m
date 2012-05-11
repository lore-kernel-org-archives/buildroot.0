From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Fri, 11 May 2012 14:37:23 +0100
Subject: [Buildroot] [PATCH] gpsd: Replace the deprecated finite
 function with the isfinite macro
In-Reply-To: <CAHt8ZCPkmz+w02RLo38xxFoGOxS2wv+Lx1OPvXGbo15whRTZZw@mail.gmail.com>
References: <1336732472-13197-1-git-send-email-markos.chandras@imgtec.com>
 <CAHt8ZCPkmz+w02RLo38xxFoGOxS2wv+Lx1OPvXGbo15whRTZZw@mail.gmail.com>
Message-ID: <4FAD1613.6070305@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/11/2012 02:27 PM, Simon Dawson wrote:

> I submitted an nearly identical patch back in April:
> 
>   http://lists.busybox.net/pipermail/buildroot/2012-April/052597.html
> 
> At the time, it was noted that the finite calls are not present in
> newer gpsd releases, and I subsequently submitted a patch to bump the
> gpsd package from version 2.95 to 3.5:
> 
>   http://lists.busybox.net/pipermail/buildroot/2012-April/052880.html
> 
> Neither of my patches has been committed yet; just wanted to tie the
> threads together here.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

Hi Simon,

I presume a bump would be preferred as I see no reason to try and keep
such an old version alive

-- 
markos
