From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Oct 2014 23:04:18 +0100
Subject: [Buildroot] [PATCH] lame: Disable for Aarch64 and MIPS when
 building with debug symbols
In-Reply-To: <544FD129.1070402@imgtec.com>
References: <1414515902-3153-1-git-send-email-Vincent.Riera@imgtec.com>
 <544FCF49.5010704@zacarias.com.ar> <544FCFAE.3050806@imgtec.com>
 <544FD003.1080800@zacarias.com.ar> <544FD129.1070402@imgtec.com>
Message-ID: <545012E2.2000604@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/10/14 18:23, Vicente Olivert Riera wrote:
> Dear all,
>
> On 10/28/2014 05:18 PM, Gustavo Zacarias wrote:
> > On 10/28/2014 02:17 PM, Vicente Olivert Riera wrote:
> >
> >> You are right, the dependences should be propagated to those packages. I
> >> will respin a new version.
> >>
> >> My apologies for that.
> >
> > It's more of an open question, i don't think we want to go dependency
> > hell on this.
> > We could probably just disable debugging for the particular package on
> > the particular conditions i think.
> > Regards.
>
> Uhm..., yeah, to be honest that was my first thought when I found what was the
> problem.
>
> I'm fine with that. Let's wait until some other developers say their opinion as
> well.

 I agree that that is the way to go: disable debug on the architectures that
have a problem with it.


 Regards,
 Arnout

>
> Best regards,


-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
