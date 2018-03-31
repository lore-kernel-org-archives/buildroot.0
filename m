From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 31 Mar 2018 18:27:45 +0200
Subject: [Buildroot] patchwork.ozlabs.org down, and e-mails not recorded
In-Reply-To: <20180320160847.2ef26965@windsurf>
References: <20180213231930.26ab0efb@windsurf.lan>
 <16c3e28e-8da0-75f0-1f9a-c1ed86741fc3@au1.ibm.com>
 <20180214090148.5b21f55e@windsurf.lan>
 <87lgftau6p.fsf@linkitivity.dja.id.au>
 <20180216154959.4db712f5@windsurf.lan>
 <874llocfch.fsf@dell.be.48ers.dk>
 <20180312015055.3dc9789c@canb.auug.org.au>
 <7a371f6c-1705-dcf6-2ff5-dc5ba46b7114@ozlabs.org>
 <c5bfa3f1-3d33-bfac-5cf3-3de3204bb878@ozlabs.org>
 <20180320160847.2ef26965@windsurf>
Message-ID: <20180331162745.GM25161@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello guys!

On 2018-03-20 16:08 +0100, Thomas Petazzoni spake thusly:
> On Tue, 20 Mar 2018 20:19:01 +0800, Jeremy Kerr wrote:
> > Good news: with the logging we had in place recently (and a fix to
> > correct error reporting), it looks like we've found the problem with
> > parsing emails from a series. This issue was recently addressed by
> > Daniel, so I've updated patchwork.ozlabs.org to run the current
> > stable/2.0 branch, which has fixes for these. Hopefully this resolves
> > the issue with dropped patches.
> > 
> > The update should also make the mail parser a little more robust against
> > transient failures too.
> > 
> > Let me know how things go over the next few days.
> 
> Thanks a lot for this debugging effort! We'll monitor how patchwork
> behaves in the next days and give you some feedback (good or bad).

Thanks indeed! :-)

We've got a little follow up issue now: some patches are not attributed
to the series they belong too, for example:
    https://patchwork.ozlabs.org/patch/893732/

should belong to:
    https://patchwork.ozlabs.org/project/buildroot/list/?series=36782

Similarly:
    https://patchwork.ozlabs.org/patch/893678/

should belong to:
    https://patchwork.ozlabs.org/project/buildroot/list/?series=36757

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
