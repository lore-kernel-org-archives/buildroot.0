From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 30 Jun 2016 17:26:12 +0200
Subject: [Buildroot] Buildroot package for psycopg module for Beaglebone
 black
In-Reply-To: <5773DC07.8070709@gmail.com>
References: <57725E95.3040107@gmail.com>
 <2c149f23-5762-32d8-f298-5f0af402c480@mind.be> <57737D1C.7050407@gmail.com>
 <CAGm1_ktjXHNA8j-0VYOsn9qUhbr2xaeFMTh+RGr1qu6g2-fWow@mail.gmail.com>
 <577394C0.5050006@gmail.com>
 <CAGm1_ku9J9pG=2fQDeRqOp3NnMD2BfzAtQ3iYkOMjHOKyAVjCQ@mail.gmail.com>
 <5773DC07.8070709@gmail.com>
Message-ID: <bfd8b168-8e03-02f6-6b98-f0d9a39725ad@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29-06-16 16:32, pborut123 wrote:
> I had to modify generated solution only to add (fake) host side pg_config
> script, that is missing from postgresql package.

 What you should do instead is to update package/postgresql/pg_config and add
the required version option. And that should be a separate patch, of course. The
commit log of that patch should mention that psycopg needs it.

 Regards,
 Arnout

> I think that here pg_config is needed only to get postgresql version.

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
