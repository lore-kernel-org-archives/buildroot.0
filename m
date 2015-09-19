From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Sep 2015 15:51:50 +0200
Subject: [Buildroot] [PATCH 1/1] Signed-off-by: Hiroshi Kawashima
 <kei-k@ca2.so-net.ne.jp>
In-Reply-To: <38121FAB319C3344930C920E7B518313252D32D7@LEMAIL01.le.imgtec.org>
References: <201509190155.t8J1t0tf027928@ms-omx02.plus.so-net.ne.jp>
 <38121FAB319C3344930C920E7B518313252D32D7@LEMAIL01.le.imgtec.org>
Message-ID: <55FD6876.70803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19-09-15 10:34, Vincent Olivert Riera wrote:
[snip]
> On 19/09/15 02:55, Hiroshi Kawashima wrote:
[snip]
>> +comment "squeezelite needs a toolchain w/ wchar (incur from flac)"
> 
> I would place this comment at the end of the BR2_PACKAGE_SQUEEZELITE,
> before defining the BR2_PACKAGE_SQUEEZELITE_ENABLE_RESAMPLE and
> BR2_PACKAGE_SQUEEZELITE_WITH_RESAMPLE_MP.

 No, wrong. The comment should always be either at the beginning or at the end
of the file. Otherwise, the indentation of the sub-options will be wrong (i.e.,
they won't be indented).



 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
