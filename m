From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Sep 2012 20:59:44 +0200
Subject: [Buildroot] [PATCH 13/13] microperl: mark as DEPRECATED
In-Reply-To: <CAB0FRsuHy1wibu0X=8q168hKbhO-Rv2FMgewY1O1LN3HAfV4Jw@mail.gmail.com>
References: <1347107325-4163-1-git-send-email-francois.perrad@gadz.org>
 <1347107325-4163-13-git-send-email-francois.perrad@gadz.org>
 <20120920222203.2c608fcf@skate>
 <CAB0FRsuHy1wibu0X=8q168hKbhO-Rv2FMgewY1O1LN3HAfV4Jw@mail.gmail.com>
Message-ID: <20120921205944.774e22d6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fran?ois Perrad,

On Fri, 21 Sep 2012 20:53:08 +0200, Fran?ois Perrad wrote:

> I added this commit after your request in
> http://patchwork.ozlabs.org/patch/180227/ (Aug. 27, 2012, 9:54 p.m.)

Yes, I perfectly remember asking you to mark microperl as deprecated,
since you were saying that microperl was a dead-end. My question here
is different: knowing that microperl is deprecated, why would we bother
bumping its version, making fixes and so on? It doesn't look really
interesting to write patches against deprecated and even less
interesting to review such patches :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
