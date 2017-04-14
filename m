From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Apr 2017 22:43:41 +0200
Subject: [Buildroot] [PATCH 1/1] automake: add patch fixing GNU bug
 #25299
In-Reply-To: <fb021600-fec9-11e8-b7e3-03b660e975b8@mind.be>
References: <1491568417-5355-1-git-send-email-heiko.thiery@gmail.com>
 <CAEyMn7YddOxBVShv7WvEcMLCL-rJL_CdJp7d0R0NU0=ZYVwrKA@mail.gmail.com>
 <fb021600-fec9-11e8-b7e3-03b660e975b8@mind.be>
Message-ID: <20170414224341.19521688@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Apr 2017 16:10:06 +0200, Arnout Vandecappelle wrote:

>  And it would also help if you could give a list of autoreconf'ed packages that
> you have tested with this patch.

I thought I had given feedback on this patch, but apparently no. One
think that isn't clear to me is what packages are affected:

 * Are only packages autoreconf'ed by Buildroot affected by the @
   issue ?

 * Or are all autotools packages affected ? If that's the case, then
   this patch is not sufficient: we would have to autoreconf all
   autotools packages, but is not really doable.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
