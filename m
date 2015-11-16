From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Nov 2015 15:04:40 +0100
Subject: [Buildroot] [PATCH] package/gauche: fix getcontext not solved
 error on link
In-Reply-To: <DCB69957-FA7C-447C-B55F-CCB8ED8A4D1C@ca2.so-net.ne.jp>
References: <201511131005.tADA5pt9030611@ms-omx02.plus.so-net.ne.jp>
 <56497F25.4020100@mind.be>
 <DCB69957-FA7C-447C-B55F-CCB8ED8A4D1C@ca2.so-net.ne.jp>
Message-ID: <5649E278.8060406@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-11-15 13:33, Hiroshi Kawashima wrote:
> Dear Arnout.
> Thank you for your comment.
> 
> Both of patch to configure and configure.ac are already included.

 Ah sorry, the patch doesn't contain a diffstat that's why I missed it.

 Also in your commit log you say "instead of", that should have been "in
addition to".

 I already gave my Reviewed-by so that stands.

 Regards,
 Arnout

> 
> I will send patch to upstream.


[snip]
-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
