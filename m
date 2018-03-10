From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Mar 2018 12:58:06 +0100
Subject: [Buildroot] patchwork.ozlabs.org down, and e-mails not recorded
In-Reply-To: <20180216154959.4db712f5@windsurf.lan> (Thomas Petazzoni's
 message of "Fri, 16 Feb 2018 15:49:59 +0100")
References: <20180105214340.6f0cc1f7@windsurf>
 <ced2aeb2-82f6-c836-dd5a-e65c6b49c81a@au1.ibm.com>
 <20180108091044.1141f540@windsurf> <20180205224500.1a34e02a@windsurf>
 <981ecf77-767e-3c90-243f-67251d956c21@au1.ibm.com>
 <20180213231930.26ab0efb@windsurf.lan>
 <16c3e28e-8da0-75f0-1f9a-c1ed86741fc3@au1.ibm.com>
 <20180214090148.5b21f55e@windsurf.lan>
 <87lgftau6p.fsf@linkitivity.dja.id.au>
 <20180216154959.4db712f5@windsurf.lan>
Message-ID: <874llocfch.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi Daniel,

 >> Andrew mentioned to me that we might have a race condition, and so I had
 >> a quick poke at loading patches in parallel. Sure enough I was able to
 >> easily hit an issue at least on the MySQL backend. (OzLabs uses postgres
 >> but it's still a good data-point as it shows we're not handling this
 >> sort of thing in code.)
 >> 
 >> This is quite possibly related to your issue - I will do some more
 >> investigation and let you know how we go.

 > Thanks a lot for the follow-up details on this.

 > I think it's worth mentioning that it seems to be a relatively "recent"
 > regression, probably within the last 6 months or so. In the past, we
 > were clearly not seeing such a problem, and all patches were properly
 > recorded. The problem is frequent enough that we would have noticed.

Any news on this? We still see missing mails, and I even received a
temporary bounce from the patchwork addres this morning:


This is the mail system at host ozlabs.org.

I'm sorry to have to inform you that your message could not
be delivered to one or more recipients. It's attached below.

For further assistance, please send mail to postmaster.

If you do so, please include this problem report. You can
delete your own text from the attached returned message.

                   The mail system

<patchwork-incoming-buildroot@bilbo.ozlabs.org> (expanded from
    <incoming-buildroot@patchwork.ozlabs.org>): temporary failure

Reporting-MTA: dns; ozlabs.org
X-Postfix-Queue-ID: 3zvfxM6m0Nz9sZ8
X-Postfix-Sender: rfc822; buildroot-bounces at busybox.net
Arrival-Date: Mon,  5 Mar 2018 10:53:10 +1100 (AEDT)

Final-Recipient: rfc822; patchwork-incoming-buildroot at bilbo.ozlabs.org
Original-Recipient: rfc822;incoming-buildroot at patchwork.ozlabs.org
Action: failed
Status: 4.3.0
Diagnostic-Code: x-unix; temporary failure

-- 
Bye, Peter Korsgaard
