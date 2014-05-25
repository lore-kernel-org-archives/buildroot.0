From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 25 May 2014 21:44:53 +0200
Subject: [Buildroot] [PATCH 1 of 4 v2 for-2014.05] website: rework
	Contribute page to avoid duplication with manual
In-Reply-To: <b4640a0a0f1e43ba8098.1400962008@argentina> (Thomas De
 Schampheleire's message of "Sat, 24 May 2014 22:06:48 +0200")
References: <patchbomb.1400962007@argentina>
 <b4640a0a0f1e43ba8098.1400962008@argentina>
Message-ID: <8761ktabii.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > The manual contains details about how users can contribute to
 > buildroot. The website also had such a list, but with much less detail and
 > not containing all topics.
 > In order to avoid duplicating this information, simply list the different
 > topics without detail on the website, and add a link to the relevent
 > chapter of the manual.

 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

 > ---
 > v2: add missing closing </p> tag in last paragraph

 >  docs/contribute.html |  53 ++++++++++++++++++++--------------------------
 >  1 files changed, 23 insertions(+), 30 deletions(-)

 > Note: the current manual does not have the updated info. At this instant the
 > info is still on the git version of the manual:
 > http://nightly.buildroot.org/manual.html#_contributing_to_buildroot
 > When the 2014.05 release is made, the manual will be updated and all will be
 > well.

 > diff --git a/docs/contribute.html b/docs/contribute.html
 > --- a/docs/contribute.html
 > +++ b/docs/contribute.html
 > @@ -2,38 +2,31 @@
 
 >  <h2>Contribute</h2>
 
 > -Buildroot is an open source project and if you want to contribute, here a few
 > -pointers to get you started.
 > +<p>Buildroot is an open source project and you are very welcome to contribute to
 > +it.<br />
 > +There are many different ways to contribute:</p>
 
 > -<p>Don't forget to look at <a href="./support.html">Support</a> if you need any
 > -help.
 > -And thanks for your help !</p>
 > +<ul>
 > +<li>Reproducing, analyzing and fixing bugs from our
 > +    <a href="https://bugs.buildroot.org/">bug tracker</a></li>
 > +<li>Analyzing and fixing <a href="http://autobuild.buildroot.org/">
 > +    autobuild failures</a></li>
 > +<li>Reviewing and testing patches sent by other developers. See the
 > +    <a href="http://lists.busybox.net/mailman/listinfo/buildroot">mailing list
 > +    </a> or <a href="http://patchwork.ozlabs.org/project/buildroot/list/">
 > +    patchwork</a>.</li>
 > +<li>Working on items from the
 > +    <a href="http://www.elinux.org/Buildroot#Todo_list">TODO list</a></li>
 > +<li>Submitting your own patches through the
 > +    <a href="http://lists.busybox.net/mailman/listinfo/buildroot">mailing list
 > +    </a></li>
 > +</ul>
 
 > -<h3>Autobuilders</h3>
 > +<p>For more details on these topics, check out chapter
 > +<a href="http://buildroot.uclibc.org/downloads/manual/manual.html#_contributing_to_buildroot">
 > +Contributing to buildroot</a> in the Buildroot manual. Thanks for your help!</p>

I've changed this to 'check out the <a href=..>Contributing to
buildroot</a> chapter in the Buildroot manual' and committed, thanks.

-- 
Bye, Peter Korsgaard
