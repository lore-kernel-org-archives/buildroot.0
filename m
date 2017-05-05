From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 5 May 2017 23:28:29 +0200
Subject: [Buildroot] Analysis of build results for 2017-05-04
In-Reply-To: <20170505132423.3602e294@free-electrons.com>
References: <20170505062802.8C0262097E@mail.free-electrons.com>
 <20170505132423.3602e294@free-electrons.com>
Message-ID: <20170505232829.476e1873@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 5 May 2017 13:24:23 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> 
> >          arm |                 poppler-0.54.0 | NOK | http://autobuild.buildroot.net/results/b749b252f63945f278358dcd76b6e9c55214ccd8 |     
> >         i686 |                 poppler-0.54.0 | NOK | http://autobuild.buildroot.net/results/92e68defe746eb4852b3a45bb27af2282d3f4c7e |     
> 
> error: 'vector' in namespace 'std' does not name a template type
> 
> Happens in the Qt backend. Peter, perhaps you have an idea ?
> 

Just a missing include for std::vector, fixed by [1]...

Regards,
Peter

[1] https://patchwork.ozlabs.org/patch/759196/
