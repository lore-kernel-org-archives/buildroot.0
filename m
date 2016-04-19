From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Apr 2016 00:36:42 +0200
Subject: [Buildroot] [PATCHv2 4/4] Add package cbootimage-configs
In-Reply-To: <20160419230836.202d4cbb@free-electrons.com>
References: <1458227038-16383-1-git-send-email-julian@jusst.de>
 <1458227038-16383-5-git-send-email-julian@jusst.de>
 <20160419230836.202d4cbb@free-electrons.com>
Message-ID: <5716B2FA.6090500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/19/16 23:08, Thomas Petazzoni wrote:
> Hello,
>
> On Thu, 17 Mar 2016 16:03:58 +0100, Julian Scheel wrote:
[snip]
>> >+TARGET_SIZE = $(TARGET_CROSS)size
> To be moved to package/Makefile.in I believe, in a separate patch.

  Why do you need a cross-size anyway? size, like readelf, should be universal, no?


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
