From: Marco <chopin1998@gmail.com>
Date: Mon, 21 Feb 2011 16:33:31 +0800
Subject: [Buildroot] build python failed
Message-ID: <AANLkTinfpWsELrvHSZYq1+w-W_zF6fgoSVgPEMVYxvjg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, All

    my buildroot has git pulled, and my target is at91sam9260. I choose
python package via make menuconfig, but make failed:

In file included from Include/Python.h:86,
>                  from ./Modules/python.c:4:
> Include/unicodeobject.h:575: warning: type defaults to 'int' in declaration
> of 'wchar_t'
> Include/unicodeobject.h:575: error: expected ';', ',' or ')' before '*'
> token
> In file included from Include/Python.h:86,
>                  from ./Modules/python.c:4:
> Include/unicodeobject.h:593: warning: type defaults to 'int' in declaration
> of 'wchar_t'
> Include/unicodeobject.h:593: error: expected ';', ',' or ')' before '*'
> token
> make[1]: *** [Modules/python.o] Error 1
> make[1]: Leaving directory
> `/home/marco/est_works/proj/concentrator/buildroot/output/build/python-2.7.1'
> make: ***
> [/home/marco/est_works/proj/concentrator/buildroot/output/build/python-2.7.1/.stamp_built]
> Error 2
>
>
 How can I fix the error and using python in ARM? Thank you!!!


-- 
LinuX
Violin
Canon EOS
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110221/b19d6613/attachment.html>
