From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 04 Dec 2019 16:07:54 +0100
Subject: [Buildroot] Autobuilder Package Stats Page
In-Reply-To: <20191204155348.39878299@windsurf> (Thomas Petazzoni's message of
 "Wed, 4 Dec 2019 15:53:48 +0100")
References: <1653501.gvH1ob0Lqs@laptop> <20191204155348.39878299@windsurf>
Message-ID: <87o8wojfhx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Wed, 04 Dec 2019 13:24:52 +0000
 > Mark Corbin <mark@dibsco.co.uk> wrote:

 >> I've been updating package URLs based on the status information shown on the 
 >> 'package stats' page (http://autobuild.buildroot.org/stats/), but the page 
 >> output hasn't changed to reflect these new updates.
 >> 
 >> I was wondering when/how the page is updated? I have been checking the current 
 >> URL status of packages by running './support/scripts/pkg_stats' directly from 
 >> the command line, but it would be useful if the web page was refreshed 
 >> regularly to capture any changes.

 > The page is updated once a day, the last date is at the bottom of the
 > page, together with the commit id.

 > When a "next" branch exists, the page is based on data from the next
 > branch, so that we use the latest package versions known by Buildroot.
 > However, all your URL-related changes have been merged to master, so
 > they didn't show up in the refreshed statistics page.

 > But since the release of 2019.11, next has been merged into master, but
 > next has not been removed. So the logic still thinks next is newer than
 > master.

 > Peter, could you drop the next branch ?

Sure, done.

-- 
Bye, Peter Korsgaard
