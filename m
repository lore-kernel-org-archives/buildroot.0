From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2020 18:41:45 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/docker-engine: bump to
 version 19.03.13
In-Reply-To: <20201019090825.3677582-2-christian@paral.in> (Christian
 Stewart's message of "Mon, 19 Oct 2020 02:08:25 -0700")
References: <20201019090825.3677582-1-christian@paral.in>
 <20201019090825.3677582-2-christian@paral.in>
Message-ID: <871rhhgc9y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > The Docker developers appear to no longer be tagging releases on the
 > docker/engine repository on GitHub, but are tagging releases on the main
 > moby/moby repository, which still is the true home of "dockerd."

 > This commit changes the upstream repo to moby/moby with no changes required.

 > Signed-off-by: Christian Stewart <christian@paral.in>

 > v1 -> v2:

 >  - updated hash
 >  - changed upstream to moby/moby

 > Signed-off-by: Christian Stewart <christian@paral.in>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
