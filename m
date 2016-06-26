From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 26 Jun 2016 22:22:14 +0200
Subject: [Buildroot] 3 patches to buildroot via git send-email
In-Reply-To: <20160626144849.4b5ab2fa@free-electrons.com>
References: <CAGrGpJD9MX_aNzwu357LziPAOMYLbHeQt=sKAukPCav2-anbog@mail.gmail.com>
 <20160626144849.4b5ab2fa@free-electrons.com>
Message-ID: <0b6fc661-dd89-4bb0-458a-c6a14c9c37d0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26-06-16 14:48, Thomas Petazzoni wrote:
> Hello,
> 
> As I mentioned, we received 3 times the same patch, for sdl2_ttf. And
> as Baruch noted, the commit title was wrong.
> 
> On Sat, 25 Jun 2016 21:20:04 -0600, Peter Thompson wrote:
> 
>> > Step 2 - create 3 branches (1 per patch)
> Don't do this. Create one branch only, with one commit per package.
> 
>> > submit via
>> > https://buildroot.org/downloads/manual/manual.html#submitting-patches
>> > $ git fetch --all --tags    # update with latest buildroot version
>> > $ git rebase origin/master    # redo my commits on latest buildroot version
>> > $ git format-patch -M -n -s -o outgoing origin/master #format and send it
>> > $ git send-email --to buildroot at buildroot.org outgoing/*
> Please send the patches to you first, in order to check that they look
> good.

 The sending is clearly no problem. It is a good idea however to review the
patches in outgoing/* before sending out.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
