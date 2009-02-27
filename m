From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 27 Feb 2009 10:07:02 +0100
Subject: [Buildroot] Add $(CONFIG_UPDATE) for a few packages
In-Reply-To: <49A75BE5.3020701@hq.tensilica.com>
References: <49A75BE5.3020701@hq.tensilica.com>
Message-ID: <20090227090702.GD30901@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 26, 2009 at 07:20:05PM -0800, Maxim Grigoriev wrote:
> Hello All,
>
> Can somebody review this update, please ?
>
> If you decide it's reasonable can you please, go ahead
> and apply the attached patch ?
>
> I don't have write-access to the BUILDROOT repository.
> So I cannot check it in even after approval.
>
> The suggested comment would be :
>
> "Add $(CONFIG_UPDATE) calls in all subdirectories that need it for a few packages."

Most of these packages should be converted to Makefile.autotools.in
If there is no way to override or add "CONFIG_UPDATE copy to" dirs
in there then this should be fixed.

Just a thought..
