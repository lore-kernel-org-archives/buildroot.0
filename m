From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 25 Jun 2016 00:40:24 +0200
Subject: [Buildroot] [PATCH v2 1/3] python-xlrd: new package
In-Reply-To: <CAGm1_ktr3AHMEdaOkvi1suWThga1_SWUEU64aBGMgMqHVYreMg@mail.gmail.com>
References: <1466673311-15845-1-git-send-email-yegorslists@googlemail.com>
 <66d1d741-7ea9-d671-3163-701f6a0448de@mind.be>
 <CAGm1_ktr3AHMEdaOkvi1suWThga1_SWUEU64aBGMgMqHVYreMg@mail.gmail.com>
Message-ID: <0423e445-79c3-12f5-bd12-81323490d5a3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24-06-16 08:27, Yegor Yefremov wrote:
> >  Even though licenses.py specifies BSD-4c, the actual source code doesn't. In
> > fact, several files explicitly mention that they are not derived from Giffin's
> > code. So I would say: just keep BSD-3c. licenses.py still contains the -4c so an
> > attentive legal department will still do vetting on their own.
> Should I also reduce license types in xlwt too?

 I haven't looked at xlwt, but probably yes. Just look at the headers in each
file to see if there is any with a BSD-4c or copyright Giffin.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
