From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 11:08:21 +0200
Subject: [Buildroot] [PATCH 1/1] xenomai: Add choice for Cobalt/Mercury
 core
In-Reply-To: <CAKfV1CaoGUPmL6W5xT61YECuVvN3_RthyD7sw8Cw54e_RMOYCQ@mail.gmail.com>
References: <20170406234139.31532-1-sikor6@gmail.com>
 <20170406234139.31532-2-sikor6@gmail.com>
 <20170408153452.54837e4c@free-electrons.com>
 <2fa9e5f3-79a9-090e-76ed-457be2e6e49a@mind.be>
 <CAKfV1CaoGUPmL6W5xT61YECuVvN3_RthyD7sw8Cw54e_RMOYCQ@mail.gmail.com>
Message-ID: <99d84995-3497-3072-f56a-bea2960327c6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-04-17 00:51, Pawel Sikora wrote:
> What about support for Xenomai 2.6? Should we split Xenomai into two packages
> for both versions? As it needs different patches that are currently for 3.x version
> and now if someone want to build 2.x will need to take these patches manually.
> So doesn't it really mean now, that the option with prompt for Xenomai version
> will work only for Xenomai >3.x?

 IIRC when Xenomai 3 support was introduced, we decided to simply drop support
for Xenomai 2.6.

 In fact, I would forego the 'custom Xenomai version' support entirely. I don't
see why you would ever want an older version, and if you need a newer version
than the one in Buildroot you can just bump the package. Does anyone see a
reason to support multiple versions? [Adding ThomasDS in Cc to answer that.]

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
