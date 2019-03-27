From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 08:48:41 +0100
Subject: [Buildroot] [PATCH v5] package/optee-client: fix build warnings
 from 3.4.0
In-Reply-To: <20190325180955.179bcc55@windsurf> (Thomas Petazzoni's message of
 "Mon, 25 Mar 2019 18:09:55 +0100")
References: <20190325105251.5914-1-etienne.carriere@linaro.org>
 <20190325180955.179bcc55@windsurf>
Message-ID: <87wokku59i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 > Basically, to generate the patches, you should ideally do:

 > 	git checkout v3.4.0
 > 	git cherry-pick 9dbc61b3767ab1c3dfd0a19af02926b92ae09247
 > 	git cherry-pick 16c8f548786c70df04d3a1e61bf89abce9b92389
 > 	git format-patch -N HEAD~2

Please use git cherry-pick -xs to add a reference to the original commit
sha1 and add your signed-off-by.

-- 
Bye, Peter Korsgaard
