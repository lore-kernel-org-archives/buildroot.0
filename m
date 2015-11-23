From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Nov 2015 22:51:20 +0100
Subject: [Buildroot] Buildroot defconfigs now being built on Travis CI
In-Reply-To: <20151123223332.3eff11d8@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 23 Nov 2015 22:33:32 +0100")
References: <20151123223332.3eff11d8@free-electrons.com>
Message-ID: <874mgc4c6f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > Hello,
 > I used to build the Buildroot defconfigs with a Jenkins instance
 > provided by Free Electrons, but with the increasing number of
 > defconfigs, it started to take too much time on our build server (and
 > therefore less CPU time was available for autobuild.b.o testing).

 > So, I've moved the testing of the Buildroot defconfigs to Travis CI,
 > which provides essentially free CPU time to allow open-source projects
 > to do continuous integration.

 > You can see the results at:

 >   https://travis-ci.org/buildroot/buildroot-defconfig-testing

Cool, great!

 > The last build has been fully successful, with all 95 defconfigs
 > building fine. I have scheduled to rebuild all defconfigs every two
 > days, of course only if commits have been made to Buildroot.

 > For the moment, notifications of build working fine or failing are just
 > sent to some testing IRC channel. Once the mechanism has proven to work
 > well for a week or two, I'll adjust the notifications so that they are
 > sent to the official #buildroot IRC channel, and possibly by e-mail as
 > well (to the mailing list or directly to interested people).
 > Suggestions on this are welcome.

I wouldn't mind getting a notification per email if something fails.


 > Now, if you want the gory details of how this is implemented:

Is that XFS issue something we want to fix before 2015.11? What is that
stupidpid thing about? Does travis stop if it doesn't get any output?

I see that results are copied to the autobuilder server? How are they
visualized? Just together with the other autobuild results?

Thanks for setting it up!

-- 
Bye, Peter Korsgaard
