From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 28 Aug 2013 08:46:50 +0200
Subject: [Buildroot] autobuild statistics graph
Message-ID: <CAAXf6LW8axKFZpiQFjmqWcFXTEqaHoD3uX=hk5ZSQbmz_7BabA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

The autobuild statistics shows a graph with the number of
failed/successful/total builds at:
http://autobuild.buildroot.org/stats.php

However, given that the total number of builds executed each day is
varying, it is difficult to visually draw conclusions from the graph.
I would like to propose adding another graph (or replacing the current
one) that plots the percentages of successful/failed builds. Hence,
the reference will always be 100%, and a 'success' line going up means
improvement.
In fact, in this case it makes little sense to plot both the success
and failure lines, so we can choose either one.

What do you think?
Is this difficult to realize?
If you give me some source code of how the graph is generated, I'm
willing to look into this.

Best regards,
Thomas
