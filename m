From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 26 Nov 2016 14:49:43 +0100
Subject: [Buildroot] Bare metal toolchain support?
In-Reply-To: <CAM+bi4vkv9h7sK4LOhXTm0TvZ3OiW2kNm6vfR3LHLtZmONjnzA@mail.gmail.com>
References: <CAM+bi4v0iJKAbKV8FvqwJqEw=L+DqTLZhcHWGboYBbPv1oTM0A@mail.gmail.com>
 <20161123113517.04f6ec47@free-electrons.com>
 <CAM+bi4vNKMBr0Dv9_-rsQzU_kPNrze7o9_EcSEA--g2UCVCfzg@mail.gmail.com>
 <20161123130636.5b362a27@free-electrons.com>
 <CAM+bi4ujUpa+BEtU8XAC1sCW2AoM8gUhT-Rtg8xWs-_O8KTF6A@mail.gmail.com>
 <CAM+bi4sYT51Qc72s1bpsRw8K3mOPRjMtYC171YOms1L_PG0R7g@mail.gmail.com>
 <CAM+bi4sa9FG+eac3WdciC+rGih7mKk14syiT_O0mwXeyQh_5qA@mail.gmail.com>
 <440dae9f-817e-5e1c-cc30-1d80c96d2320@mind.be>
 <CAM+bi4vkv9h7sK4LOhXTm0TvZ3OiW2kNm6vfR3LHLtZmONjnzA@mail.gmail.com>
Message-ID: <60cf7a71-3f97-7631-ab75-d1aa86c20b3e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-11-16 08:54, Alvaro Gamez wrote:
> However, I don't know if I can generalize this work to improve buildroot and
> make this
> available for anyone. Should newlib exist as a package for buildroot? Maybe only
> libgloss?

 It never hurts to throw patches on the list so they are stored for posterity.
The worst that can happen is that we don't apply them.

> I don't mind working on this, but I'd need some guidance, as I don't have
> everything clear
> yet. What could be a nice starting point?
> 
> I see on the list there was a patch from March "toolchain: add support for the
> newlib library"
> but as far as I know it hasn't been comitted. Maybe improving that patch to fix
> the issues
> it had could be the first step.

 I gave a few comments on them, but please note this remark I made in response
to Chris's patch:

>>  I've checked with other core developers and there is not a lot of enthusiasm to 
>> include this (as witnessed by the long delay in reviewing this patch). So you'd 
>> need to be very active in pushing this to make it feasible.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
