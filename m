From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Mar 2016 00:33:05 +0200
Subject: [Buildroot] [PATCH] raspberrypi,
 raspberrypi2: add a serial console
In-Reply-To: <56FAEDEF.3090304@lespocky.de>
References: <1459202897-21440-1-git-send-email-luca@lucaceresoli.net>
 <127322ee36893ff22f57884a111b3434@idefix.lespocky.dyndns.org>
 <56FA8D54.2050605@lucaceresoli.net> <56FAEDEF.3090304@lespocky.de>
Message-ID: <56FB02A1.4020503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/29/16 23:04, Alexander Dahl wrote:
> Hei hei,
>
> On 29.03.2016 16:12, Luca Ceresoli wrote:
>> However, when replying to a mail on the mailing list, please reply to
>> all. This helps involved people to follow the discussion. Typically an
>> e-mail sent directly is seen sooner that one on a mailing list only.
>
> Well, I try to remember it, each community handles this different and I
> find it annoying to receive mails twice personally. Some mailing list
> filter this, others not. ;-)
>
>> That's OK if you don't feel confident enough to give your official
>> Acked-by or Reviewed-by tag. Still, you can test the patch on a real
>> board and report back the outcome. If it works, you can add your
>> Tested-by tag. Otherwise, please report what went wrong. More details on:
>
> Yeah I actually tried to this evening, but there was a showstopper I
> filed a bug for now: https://bugs.busybox.net/show_bug.cgi?id=8831

  But that problem has nothing to do with this patch. I expect that if you 
revert the patch, your build will still fail.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
