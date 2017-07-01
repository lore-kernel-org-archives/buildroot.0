From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 1 Jul 2017 09:38:11 +0200
Subject: [Buildroot] question on setting file ownership after boot
In-Reply-To: <CABWt4ev4w1MpUOJtkVxOPG3Ry8M9JqnGEAD92ygyQdxap3k5ow@mail.gmail.com>
References: <CABWt4evLAk_=Nr3ktrPj-NEArjBaicmNkMxAoDk7HNmHe9LSug@mail.gmail.com>
 <46798e49-c7f0-ac8e-5906-6ff898a6b261@mind.be>
 <CABWt4ev4w1MpUOJtkVxOPG3Ry8M9JqnGEAD92ygyQdxap3k5ow@mail.gmail.com>
Message-ID: <6aec27d6-22ea-9ce7-014b-443736d98fda@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-06-17 22:27, Robert Smigielski wrote:
> Thank you for the clarification. 
> 
> Now that I thought about it some more my question really is why are a bunch of
> directories and files owned by user dbus up on boot up? I'm trying to find what
> causes that to happen so that I can change that to be user root. 

 Those are probably files created at runtime by either systemd or dbus.

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
