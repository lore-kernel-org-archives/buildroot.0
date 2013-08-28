From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Aug 2013 09:10:36 +0200
Subject: [Buildroot] autobuild statistics graph
In-Reply-To: <CAAXf6LW8axKFZpiQFjmqWcFXTEqaHoD3uX=hk5ZSQbmz_7BabA@mail.gmail.com>
References: <CAAXf6LW8axKFZpiQFjmqWcFXTEqaHoD3uX=hk5ZSQbmz_7BabA@mail.gmail.com>
Message-ID: <20130828091036.1a91b786@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 28 Aug 2013 08:46:50 +0200, Thomas De Schampheleire wrote:

> The autobuild statistics shows a graph with the number of
> failed/successful/total builds at:
> http://autobuild.buildroot.org/stats.php
> 
> However, given that the total number of builds executed each day is
> varying, it is difficult to visually draw conclusions from the graph.

Yeah, now you realize that I was sleeping during all those statistics
courses at the university :)

> I would like to propose adding another graph (or replacing the current
> one) that plots the percentages of successful/failed builds. Hence,
> the reference will always be 100%, and a 'success' line going up means
> improvement.
> In fact, in this case it makes little sense to plot both the success
> and failure lines, so we can choose either one.
> 
> What do you think?

Sounds sane. How would you compute what the reference is? Look at the
build results of the last 30 days (i.e the ones that appear on the
plot) ?

> Is this difficult to realize?
> If you give me some source code of how the graph is generated, I'm
> willing to look into this.

The code that generates the graph is available at
http://git.buildroot.net/buildroot-test/tree/web/graph.php. Warning:
ugly PHP code inside!

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
