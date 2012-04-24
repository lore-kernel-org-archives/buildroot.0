From: Rico Bachmann <bachmann@tofwerk.com>
Date: Tue, 24 Apr 2012 12:51:24 +0200
Subject: [Buildroot] [PATCH] Add new package apr-util
References: <1335262302-31058-1-git-send-email-bachmann@tofwerk.com>
 <20120424122445.0d7b604e@skate>
Message-ID: <op.wc9m3ydx705kjs@rico>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 24.04.2012, 12:24 Uhr, schrieb Thomas Petazzoni  
<thomas.petazzoni@free-electrons.com>:

> Le Tue, 24 Apr 2012 12:11:42 +0200,
> Rico Bachmann <bachmann@tofwerk.com> a ?crit :
>
>> +diff -rupN apr-util-1.4.1/configure.in apr-util-1.4.1-fix/configure.in
>> +--- apr-util-1.4.1/configure.in	2009-12-17 20:15:19.000000000 +0100
>> ++++ apr-util-1.4.1-fix/configure.in	2012-04-24 10:10:32.000000000 +0200
>
> This patch lacks a header explaining what it is doing, why, and a
> Signed-off-by line.

I added the Signed-off-by line and added some comments, I will send it  
soon.

>
> I'm also not convinced by this patch, can you detail why it is
> necessary? I have the impression that by passing the right environment
> variables and/or options to the configure script, you can convince it
> to do the right thing, but I haven't looked into too much details about
> how APU_FIND_APR is implemented.

I asked for some help in #apr, they told me that the check of the source  
folder
only works on folders called apr. Because I don't want to rename the source
folder of the apr package (from apr-1.4.6 to apr), I disabled the check  
and the
build works nice for me

I also haven't looked to much in the implementation of APU_FIND_APR, so I  
decided
to do the way of not checking...

>
> Regards,
>
> Thomas

-- 
Erstellt mit Operas revolution?rem E-Mail-Modul: http://www.opera.com/mail/
