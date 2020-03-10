From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 22:28:34 +0100
Subject: [Buildroot] [PATCH] package/lapack: avoid selecting lapack and
 clapack
In-Reply-To: <b78fd4ec-9115-1b8f-62b2-6905f399ae59@mind.be> (Arnout
 Vandecappelle's message of "Wed, 5 Feb 2020 16:17:14 +0100")
References: <20190805103518.8233-1-alexandre.payen@smile.fr>
 <b78fd4ec-9115-1b8f-62b2-6905f399ae59@mind.be>
Message-ID: <87pndjoq65.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 05/08/2019 12:35, Aalx wrote:
 >> From: Alexandre PAYEN <alexandre.payen@smile.fr>
 >> 
 >> lapack and clapack generate the same libraries liblapack.so and
 >> libblas.so. So those two packages can't be selected at the same time.
 >> 
 >> This is a temporary fix waiting for a solution[2].
 >> 
 >> So:
 >> - add !BR2_PACKAGE_CLAPACK to lapack/Config.in.
 >> 
 >> [1]: http://autobuild.buildroot.org/results/375/375078ed8f965ecf92eb9674bd071a518c3ef894//
 >> [2]: http://lists.busybox.net/pipermail/buildroot/2019-August/255894.html
 >> 
 >> Signed-off-by: Alexandre PAYEN <alexandre.payen@smile.fr>
 >> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 >> Cc: Romain Naour <romain.naour@smile.fr>
 >> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
