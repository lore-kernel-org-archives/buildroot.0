From: Mike Zick <minimod@morethan.org>
Date: Fri, 9 May 2014 10:18:26 -0500
Subject: [Buildroot] [Question] Is it ok to change Buildroot for own
 needs?
In-Reply-To: <536CA3D7020000460004F5B8@gwia2.rz.hs-offenburg.de>
References: <536CA3D7020000460004F5B8@gwia2.rz.hs-offenburg.de>
Message-ID: <20140509101826.107d7f42@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 09 May 2014 09:45:59 +0200
"Frank Ihle" <frank.ihle@hs-offenburg.de> wrote:

> Hi everyone,
> 
> I'm not a Pro, when it comes to the license of someone's other
> Software. Basically I'd like to add a new menu that includes some of
> the Target packages. Is it ok for "Buildroot" if i change it like
> this ?
> 

Yes.

And if you intend to submit your changes to the Buildroot project, the
best way.

If you intend to keep your changes private (because they are
proprietary or some other reason) -
Then you best choice is to put them in the BR2_EXTERNAL tree.

That leaves the project tree un-modified (easier to get support for
any problems with that part) and your "private" additions in the
BR2_EXTERNAL sub-tree of your project.

Mike
> Kind Regards
> 
> Frank
> 
