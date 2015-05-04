From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 4 May 2015 15:50:20 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/mono: bump to version 4.0.1
In-Reply-To: <877fsps6sa.fsf@dell.be.48ers.dk>
References: <1430402595-5355-1-git-send-email-angelo.compagnucci@gmail.com>
 <1430402595-5355-3-git-send-email-angelo.compagnucci@gmail.com>
 <20150503153134.5f5764f4@free-electrons.com>
 <CA+TH9Vkxv4xdt+WZpkhyQa-LF-8J+3LDq-K37fhA0OgqZEQ_Tg@mail.gmail.com>
 <877fsps6sa.fsf@dell.be.48ers.dk>
Message-ID: <CA+TH9VnbJ_Dng_TPEzH20thDa1Hm3is+g1NP5LP8apqVwkmszQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard, Thomas Petazzoni,

2015-05-03 23:14 GMT+02:00 Peter Korsgaard <peter@korsgaard.com>:
>>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:
>
> Hi,
>
>>> /usr/bin/install: cannot create regular file
>  >> `/home/peko/autobuild/instance-0/output/host/usr/lib/mono/xbuild-frameworks/.NETFramework/v3.0/RedistList/FrameworkList.xml':
>  >> File exists/usr/bin/install: cannot create regular file
>  >> `/home/peko/autobuild/instance-0/output/host/usr/lib/mono/xbuild/Microsoft/Portable/v4.5/Microsoft.Portable.Common.targets':
>  >> File exists
>  >>
>  >> Can you investigate?
>
>  > Sure! Honestly it seems a little strange for me, I had several
>  > compilation test and a system with mono running for a side project and
>  > this is not happened.
>
>  > Tomorrow I will look to it.
>
> It looks like a parallel build issue with high BR2_JLEVEL settings. We
> could move to MAKE1 but that will probably slow down the build quite a bit.

I cannot reproduce the problem here. I did several compilation with
make and make -j (2-4-8-24-32) with various values but the compilation
always ends correctly.
I used both the .config of autobuild, both other configs created for
the purpose.

Please advice on a better way to help to debug this problem.

>
> --
> Bye, Peter Korsgaard

Sincerely, Angelo.



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
