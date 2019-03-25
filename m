From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 25 Mar 2019 12:33:57 -0500
Subject: [Buildroot] [PATCH] package/libssh2: security bump to latest git
In-Reply-To: <253e0999-90aa-778a-c247-1926d48d5475@mind.be>
References: <20190320211859.18155-1-peter@korsgaard.com>
 <253e0999-90aa-778a-c247-1926d48d5475@mind.be>
Message-ID: <CANQCQpbUNbvyO=EMEKBS5Z4zXGguGx3FoQohaJ1Bnt938_m4cQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout / Peter,

On Wed, Mar 20, 2019 at 6:02 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 20/03/2019 22:18, Peter Korsgaard wrote:
> > Bump the version to latest git to fix the following security issues:

I didn't check the version details but wondered if we were based off
of 1.8.x or latest?  I noticed they just dropped a 1.8.1 last week and
a 1.9 is pending
(https://www.libssh2.org/mail/libssh2-devel-archive-2019-03/0023.shtml).


>
> [snip]
> >
> > Drop 0003-openssl-fix-dereferencing-ambiguity-potentially-caus.patch as that
> > is now upstream.
> >
> > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>
>  Applied to master, thanks.
>
>  Regards,
>  Arnout
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



--

Matthew Weber | Pr. Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
