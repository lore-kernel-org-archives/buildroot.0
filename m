From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 17:20:31 +0100
Subject: [Buildroot] [RFC] Responsive Design Website
In-Reply-To: <CA+TH9VmP76wiQFJgn4i+f6b_oO7uQc2Duoswz+H5vrj=F0AOTA@mail.gmail.com>
References: <CA+TH9VmP76wiQFJgn4i+f6b_oO7uQc2Duoswz+H5vrj=F0AOTA@mail.gmail.com>
Message-ID: <20141028172031.28dfdde4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Mon, 27 Oct 2014 22:56:10 +0100, Angelo Compagnucci wrote:

> As a sign of gratitude for my recently committed mono patches, I
> thought having a responsive design website could be a nice addition to
> Buildroot.
> 
> With this in mind, I updated to the latest bootstrap3 and jquery
> versions, fixed various unbootstrapness everywhere and made the
> website responsive!
> 
> The website is very similar to the old one, the most difficult task
> was to clean it to let conditional css rules make their job.
> 
> You can try it (also with your mobile phone) at:
> 
> http://buildrootrd.idea-on-line.it/ (WARNING: dns is stil propagating)
> 
> I'm open to suggestions and if you like the work I'll continue to fix
> the entire website and I'll send a patch in the next few days.

Definitely looks good. And it's nice to have someone interested in
working on the web site. If you're interested, I have a TODO list of
things to do on the web site :-)

However, one thing that I find weird in your new version is that the
"Recent commits" and "Recent discussions" are placed in a weird way
from a horizontal point of view. On the original web site, they look
nicely aligned with the gray block containing the few words of
introduction about Buildroot. But on your new version, they are placed
in a weird way.

In case I'm not clear, here are the screenshot before/after:

  http://free-electrons.com/~thomas/buildroot-org-before.png
  http://free-electrons.com/~thomas/buildroot-org-after.png

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
