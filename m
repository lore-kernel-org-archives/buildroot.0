From: Andrea Cappelli <a.cappelli@gmail.com>
Date: Fri, 26 Feb 2016 00:36:00 +0100
Subject: [Buildroot] [PATCH 1/1] New package: uwsgi
In-Reply-To: <0BBD31CA-6B23-476F-842F-8F704E319510@xiot.nl>
References: <1451577776-29708-1-git-send-email-a.cappelli@gmail.com>
 <0BBD31CA-6B23-476F-842F-8F704E319510@xiot.nl>
Message-ID: <CAKR0bvsRVtXAgNYk-fmeTr3Z4CoeYZJxPbsE7H95r8GMDzRhww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-02-25 21:21 GMT+01:00 Eelco Chaudron <echaudron@xiot.nl>:

> Hi Andrea,
>

Hi Eelco


>
> I see that your patch has not yet been included in the master branch, and
> I was wondering if it has anything to do with the failure to compile when
> using uclibc?
>

I think the main problem is that I didn't have time to rework the patch
applying all style recommendations (I only changed the patch according to
Thomas suggestion, but i know I miss something)



> When I add your patch I get the following build error:
>
> [/home/echaudron/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc]
> core/uwsgi.o
> core/uwsgi.c: In function ?uwsgi_backtrace?:
> core/uwsgi.c:1786:22: fatal error: execinfo.h: No such file or directory
>  #include <execinfo.h>
>                       ^
> compilation terminated.
> Makefile:4: recipe for target 'all' failed
> make[2]: *** [all] Error 1
>
>
> Before I try to make it work, have you (or anyone else) seen/fixed this?
>

I compiled it on tag 2015.11.1 (9f0610c188007ee481508d453b062d77614c153d)
because I have some devices in production using that version, and the build
was successfull; I didn't see this error before, but I can try to
investigate it on my dev board tomorrow

Best regards



-- 
Andrea Cappelli
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160226/3d037e55/attachment-0001.html>
