From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 20 Feb 2016 23:39:51 +0100
Subject: [Buildroot] Problem with package wvdial 1.61
In-Reply-To: <CADj18OU-NiTPs0gk8RuQtfuepqytuaXRz7cCWL4-QmXwVSGt5w@mail.gmail.com>
References: <CADj18OU-NiTPs0gk8RuQtfuepqytuaXRz7cCWL4-QmXwVSGt5w@mail.gmail.com>
Message-ID: <56C8EB37.7020206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/18/16 10:02, Pascal K wrote:
> --> WvDial: Internet dialer version 1.61
> --> Warning: section [Dialer Defaults] does not exist in wvdial.conf.


 You didn't report that bit above.

 However, the [Dialer Defaults] section does exist... Just as a sanity check,
can you remove the first (empty) line of the file? Else you'll have to dive into
the wvdial code to find why it wouldn't find the Dialer Defaults section...


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
