From: William Wagner <will_wagner@carallon.com>
Date: Mon, 01 Mar 2010 15:04:57 +0000
Subject: [Buildroot] X11R7.5 git branch
In-Reply-To: <4B8AB776.40204@gmail.com>
References: <4B8AB776.40204@gmail.com>
Message-ID: <4B8BD799.3040008@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/02/2010 18:35, Paulius Zaleckas wrote:
> Hi,
>
> As we have discussed earlier I have put all my X11R7.5 work in:
>
> git://gitorious.org/takeme-buildroot/takeme-buildroot.git x11r75
>
> Should I post patch series to the list?
> I am waiting for your comments on my work!

Paulius, have started look at what you have done. Good work, 
depressingly similar to all the work I have done, but oh well.

One thing I have noticed is that you have quite a few changes in there 
that are not related to x11, any chance of splitting those out as 
separate patches as don't want them to complicate review.

Peter - what do you suggest should be the process for getting this in, 
most of it looks good but there are a few places where I think things 
can be improved. Should Paulius and I try to get a master repository 
that we both sign off on?

Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
