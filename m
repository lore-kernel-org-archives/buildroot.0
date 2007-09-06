From: Carmelo AMOROSO <carmelo.amoroso@st.com>
Date: Thu, 06 Sep 2007 09:46:09 +0200
Subject: [Buildroot] Qtopia 4.3.1 on X86
In-Reply-To: <1189062690.13373.11.camel@cyclops.infocab.com.au>
References: <1189062690.13373.11.camel@cyclops.infocab.com.au>
Message-ID: <46DFB041.1030509@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam Hawes wrote:
> Hi,
>
> I'm trying to build Qtopia in Buildroot for X86.  I've had a lot of
> issues with "macro index requires 2 arguments...".  The only solution
> I've found is to undefine that macro in all the files where it
> complains.
>
> Has anyone else found a more elegant solution to this problem? Is there
> a patch available or should I submit my patch to Qtopia to the list?
>
> Cheers,
> A
>
>   
The problem is that you have uClibc configure with SUSv3_LEGACY_MACRO on 
that define index.

Carmelo
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
>   
