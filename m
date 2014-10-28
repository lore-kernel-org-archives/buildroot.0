From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Oct 2014 14:18:59 -0300
Subject: [Buildroot] [PATCH] lame: Disable for Aarch64 and MIPS when
 building with debug symbols
In-Reply-To: <544FCFAE.3050806@imgtec.com>
References: <1414515902-3153-1-git-send-email-Vincent.Riera@imgtec.com>
 <544FCF49.5010704@zacarias.com.ar> <544FCFAE.3050806@imgtec.com>
Message-ID: <544FD003.1080800@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/28/2014 02:17 PM, Vicente Olivert Riera wrote:

> You are right, the dependences should be propagated to those packages. I
> will respin a new version.
> 
> My apologies for that.

It's more of an open question, i don't think we want to go dependency
hell on this.
We could probably just disable debugging for the particular package on
the particular conditions i think.
Regards.
