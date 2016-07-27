From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 27 Jul 2016 21:31:46 +0000
Subject: [Buildroot] Access to Buildroot git via https
In-Reply-To: <87y44mx0qa.fsf@dell.be.48ers.dk>
References: <1468831359.3068.19.camel@synopsys.com>
 <20160718104900.77748f2a@free-electrons.com>
 <1469608243.6389.5.camel@synopsys.com>
 <20160727222522.12c9ce82@free-electrons.com>
 <87y44mx0qa.fsf@dell.be.48ers.dk>
Message-ID: <1469655016.3002.2.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, Thomas,

On Wed, 2016-07-27 at 22:52 +0200, Peter Korsgaard wrote:
> > 
> > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
> ?> Hello,
> ?> On Wed, 27 Jul 2016 08:32:13 +0000, Alexey Brodkin wrote:
> 
> ?>> I just noticed GitHub repo was not updated in 10 days.
> ?>> Is there a problem with it?
> 
> ?> My mistake. Some time ago, someone (Romain?) reported that the new tags
> ?> were not pushed to the Github repository. So I changed the "git push"
> ?> in my script to "git push --tags". Except that this only seems to push
> ?> the tags, not the commits themselves when there are new commits but no
> ?> new tags.
> 
> ?> So I'm now doing a "git push" *and* a "git push --tags". This should
> ?> hopefully fix the problem.
> 
> I *think* you can use git push --all.

At least now GitHub tree matches?https://git.busybox.net/buildroot/.
Thanks a lot for a prompt fix!

-Alexey
