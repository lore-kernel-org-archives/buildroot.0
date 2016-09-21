From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Sep 2016 23:12:29 +0200
Subject: [Buildroot] [PATCH 1/1] shapelib: new package
In-Reply-To: <20160921200430.74f46a81@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 21 Sep 2016 20:04:30 +0200")
References: <1469969150-3029-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <20160921155729.1c4332b7@free-electrons.com>
 <20160921164753.j56sstaxx7jy4j66@tarshish>
 <20160921200430.74f46a81@free-electrons.com>
Message-ID: <8760pprm82.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Wed, 21 Sep 2016 19:47:53 +0300, Baruch Siach wrote:

 >> On Wed, Sep 21, 2016 at 03:57:29PM +0200, Thomas Petazzoni wrote:
 >> > Thanks, I've applied your patch, after doing the following changes:
 >> > 
 >> >     [Thomas:
 >> >      - adjust the license: it's MIT or LGPLv2, add web/license.html to the
 >> >        license files
 >> >      - rewrap Config.in help text
 >> >      - add entry to the DEVELOPERS file.]  
 >> 
 >> A DEVELOPERS file update on every new package makes cherry-picking harder. For 
 >> that reason, I think, Peter stopped updating the CHANGES file in every patch.

 > Right. What should we do then? Update the DEVELOPERS file in a separate
 > patch? But then we're going to have zillions of patches whose sole
 > purpose of to update the DEVELOPERS file. But of course, that's better
 > for cherry-picking.

Either that or I update DEVELOPERS when I also update CHANGES, but not
everyone might want to get listed / might want to get listed without
being the author of the commit adding the package.

-- 
Bye, Peter Korsgaard
