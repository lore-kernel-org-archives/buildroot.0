From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 23 Sep 2012 17:11:56 +0200
Subject: [Buildroot] [PATCH 13/13] microperl: mark as DEPRECATED
In-Reply-To: <20120921205944.774e22d6@skate>
References: <1347107325-4163-1-git-send-email-francois.perrad@gadz.org>
 <1347107325-4163-13-git-send-email-francois.perrad@gadz.org>
 <20120920222203.2c608fcf@skate>
 <CAB0FRsuHy1wibu0X=8q168hKbhO-Rv2FMgewY1O1LN3HAfV4Jw@mail.gmail.com>
 <20120921205944.774e22d6@skate>
Message-ID: <CAB0FRsthWPv3+bHe-f982r6wSfYS7ocpoFRS8cE6xxhpf_pYqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/9/21 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Fran?ois Perrad,
>
> On Fri, 21 Sep 2012 20:53:08 +0200, Fran?ois Perrad wrote:
>
>> I added this commit after your request in
>> http://patchwork.ozlabs.org/patch/180227/ (Aug. 27, 2012, 9:54 p.m.)
>
> Yes, I perfectly remember asking you to mark microperl as deprecated,
> since you were saying that microperl was a dead-end. My question here
> is different: knowing that microperl is deprecated, why would we bother
> bumping its version, making fixes and so on? It doesn't look really
> interesting to write patches against deprecated and even less
> interesting to review such patches :-)
>

Today, 5 packages depend on microperl :
    autoconf
    automake
    ntp
    samba
    libxml-parser-perl (requires only a full host perl)
So, I think that it is not a good idea to remove it (after a deprecation).

Fran?ois

> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
