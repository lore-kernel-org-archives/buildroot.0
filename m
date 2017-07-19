From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 14:13:42 +0200
Subject: [Buildroot] [PATCHv3] support/tests: allow properly indented
 config fragment
In-Reply-To: <00f33a0e-da8e-3d36-ecad-c8b4d02450b5@mind.be>
References: <20170718203839.14913-1-yann.morin.1998@free.fr>
 <00f33a0e-da8e-3d36-ecad-c8b4d02450b5@mind.be>
Message-ID: <20170719141342.6250b99a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Jul 2017 14:00:40 +0200, Arnout Vandecappelle wrote:
> On 18-07-17 22:38, Yann E. MORIN wrote:
> > Currently, defining a config fragment in the runtime test infra requires
> > that the fragment not to be indented. This is beark, and causes grievance
> > when looking at the code (e.g. to fix it).
> > 
> > Just strip out all leading spaces/tabs when writing the configuration
> > lines into the config file, allowing in-line indented config fragments,
> > like so:
> > 
> >     class TestFoo(bla):
> >         config = bla.config + \
> >             """
> >             FOO=y
> >             # BAR is not set
> >             """
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>  
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

I already applied yesterday evening:
https://git.buildroot.org/buildroot/commit/?id=cf3cd4388a652c9af27ef1c35622e2d0a55b99a9.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
